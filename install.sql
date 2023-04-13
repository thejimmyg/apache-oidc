CREATE SCHEMA infrastructure;

CREATE OR REPLACE FUNCTION infrastructure.whoami(method text) RETURNS text
AS $FUNCTION$
    BEGIN
        IF method='SELECT' and current_setting('infrastructure.mode', false) = 'notification' THEN
           RETURN current_setting('infrastructure.notification_user', false);
        ELSE
            RETURN current_setting('infrastructure.user', false);
        END IF;
    END
$FUNCTION$ LANGUAGE plpgsql;

-- SELECT set_config('infrastructure.user', 'sub-user', false);
-- SELECT set_config('infrastructure.notification_user', 'sub-notification', false);
-- SELECT set_config('infrastructure.mode', 'user', false);
-- SELECT infrastructure.whoami('SELECT');
-- SELECT infrastructure.whoami('INSERT');
-- SELECT set_config('infrastructure.mode', 'notification', false);
-- SELECT infrastructure.whoami('SELECT');
-- SELECT infrastructure.whoami('INSERT');

--  set_config
-- ------------
--  sub-user
-- (1 row)

--     set_config
-- ------------------
--  sub-notification
-- (1 row)

--  set_config
-- ------------
--  user
-- (1 row)

--   whoami
-- ----------
--  sub-user
-- (1 row)

--   whoami
-- ----------
--  sub-user
-- (1 row)

--   set_config
-- --------------
--  notification
-- (1 row)

--       whoami
-- ------------------
--  sub-notification
-- (1 row)

--   whoami
-- ----------
--  sub-user
-- (1 row)

CREATE OR REPLACE VIEW infrastructure.openapi_operations AS
  SELECT
    n.nspname AS schema,
    p.proname AS name,
    pg_get_function_arguments(p.oid) AS arguments
  FROM pg_proc p
  LEFT JOIN pg_namespace n ON p.pronamespace = n.oid
  LEFT JOIN pg_type t ON t.oid = p.prorettype
  WHERE n.nspname NOT IN ('pg_catalog', 'information_schema')
  AND starts_with(pg_get_function_arguments(p.oid), 'input ')
  ORDER BY schema, name
;

-- Thanks to https://dba.stackexchange.com/questions/35497/display-user-defined-types-and-their-details for types and cols below
CREATE OR REPLACE VIEW infrastructure.openapi_domains AS
WITH types AS (
  SELECT n.nspname,
    pg_catalog.format_type ( t.oid, NULL ) AS obj_name,
    CASE
        WHEN t.typrelid != 0 THEN CAST ( 'tuple' AS pg_catalog.text )
        WHEN t.typlen < 0 THEN CAST ( 'var' AS pg_catalog.text )
        ELSE CAST ( t.typlen AS pg_catalog.text )
        END AS obj_type,
    coalesce ( pg_catalog.obj_description ( t.oid, 'pg_type' ), '' ) AS description
  FROM pg_catalog.pg_type t
  JOIN pg_catalog.pg_namespace n
      ON n.oid = t.typnamespace
  WHERE ( t.typrelid = 0
    OR ( SELECT c.relkind = 'c'
      FROM pg_catalog.pg_class c
      WHERE c.oid = t.typrelid ) )
  AND NOT EXISTS (
    SELECT 1
      FROM pg_catalog.pg_type el
      WHERE el.oid = t.typelem
      AND el.typarray = t.oid )
  AND n.nspname <> 'pg_catalog'
  AND n.nspname <> 'information_schema'
  AND n.nspname <> 'infrastructure'
  AND n.nspname !~ '^pg_toast'
),
cols AS (
    SELECT n.nspname::text AS schema_name,
      pg_catalog.format_type ( t.oid, NULL ) AS obj_name,
      a.attname::text AS column_name,
      pg_catalog.format_type ( a.atttypid, a.atttypmod ) AS data_type,
      a.attnotnull AS is_required,
      a.attnum AS ordinal_position,
      pg_catalog.col_description ( a.attrelid, a.attnum ) AS description
    FROM pg_catalog.pg_attribute a
    JOIN pg_catalog.pg_type t
      ON a.attrelid = t.typrelid
    JOIN pg_catalog.pg_namespace n
      ON ( n.oid = t.typnamespace )
    JOIN types
      ON ( types.nspname = n.nspname
        AND types.obj_name = pg_catalog.format_type ( t.oid, NULL ) )
    WHERE a.attnum > 0
      AND NOT a.attisdropped
),
domains AS (
    SELECT n.nspname as "Schema",
        t.typname as "Name",
        pg_catalog.format_type(t.typbasetype, t.typtypmod) as "Type",
        (SELECT c.collname FROM pg_catalog.pg_collation c, pg_catalog.pg_type bt
            WHERE c.oid = t.typcollation AND bt.oid = t.typbasetype AND t.typcollation <> bt.typcollation) as "Collation",
        CASE WHEN t.typnotnull THEN 'not null' END as "Nullable",
        t.typdefault as "Default",
        pg_catalog.array_to_string(ARRAY(
            SELECT pg_catalog.pg_get_constraintdef(r.oid, true)::text FROM pg_catalog.pg_constraint r WHERE t.oid = r.contypid
        ), ' ') as "Check"
    FROM pg_catalog.pg_type t
        LEFT JOIN pg_catalog.pg_namespace n ON n.oid = t.typnamespace
    WHERE t.typtype = 'd'
)
SELECT
    c.schema_name,
    d."Name" as domain_name,
    c.column_name,
    c.data_type,
    d."Check" LIKE '%(VALUE).' || c.column_name || ' IS NOT NULL%' as is_required,
    d."Check" as check
FROM domains d
LEFT JOIN cols c ON d."Type" = c.obj_name
WHERE c.schema_name NOT IN ('pg_catalog', 'information_schema', 'infrastructure')
;

GRANT USAGE ON SCHEMA infrastructure TO infrastructureuser;
GRANT SELECT ON infrastructure.openapi_domains to infrastructureuser;
GRANT SELECT ON infrastructure.openapi_operations to infrastructureuser;


CREATE TABLE infrastructure.sub_aliases (
  alias text NOT NULL,
  sub text NOT NULL
);
CREATE UNIQUE INDEX sub_aliases_alias ON infrastructure.sub_aliases (alias);


CREATE TABLE infrastructure.migrations (
    schema text,
    version integer NOT NULL,
    started_at timestamp NOT NULL DEFAULT clock_timestamp(),
    completed_at timestamp
);
INSERT INTO infrastructure.migrations (schema, version) VALUES ('infrastructure', 0);
UPDATE infrastructure.migrations SET completed_at = clock_timestamp() WHERE schema='infrastructure' AND version = 0;

CREATE OR REPLACE VIEW infrastructure.max_migrations AS SELECT
    m.schema,
    m.version,
    m.started_at,
    m.completed_at,
    m.completed_at - m.started_at AS duration
FROM infrastructure.migrations m
WHERE (schema, version) IN (
    SELECT n.schema, MAX(n.version)
    FROM infrastructure.migrations n
    GROUP BY n.schema
);

SELECT * FROM infrastructure.max_migrations;

-- Run migrations like this:

DO $$DECLARE r record;
BEGIN
    SET infrastructure.schema = 'infrastructure';
    SET infrastructure.migration = 1;

    SELECT MAX(m.version) AS migration INTO r FROM infrastructure.migrations m WHERE schema=current_setting('infrastructure.schema');
    IF r.migration != current_setting('infrastructure.migration')::integer - 1 then
        RAISE EXCEPTION 'Cannot run migration % on a schema % at migration %', current_setting('infrastructure.migration'), current_setting('infrastructure.schema'), r.migration;
    END IF;
    INSERT INTO infrastructure.migrations (schema, version) VALUES (current_setting('infrastructure.schema'), current_setting('infrastructure.migration')::integer);

    -- Run your migrations safely here

    UPDATE infrastructure.migrations SET completed_at = clock_timestamp() WHERE schema = current_setting('infrastructure.schema') AND version = current_setting('infrastructure.migration')::integer;
END$$;

SELECT * FROM infrastructure.max_migrations;



DO $$DECLARE r record;
BEGIN
    SET infrastructure.schema = 'greet';
    SET infrastructure.migration = 1;

    SELECT MAX(m.version) AS migration INTO r FROM infrastructure.migrations m WHERE schema=current_setting('infrastructure.schema');
    IF r.migration != current_setting('infrastructure.migration')::integer - 1 then
        RAISE EXCEPTION 'Cannot run migration % on a schema % at migration %', current_setting('infrastructure.migration'), current_setting('infrastructure.schema'), r.migration;
    END IF;
    INSERT INTO infrastructure.migrations (schema, version) VALUES (current_setting('infrastructure.schema'), current_setting('infrastructure.migration')::integer);

    -- Run your migrations safely here

    CREATE SCHEMA greet;
    GRANT USAGE ON SCHEMA greet TO infrastructureuser;

    CREATE TYPE greet.greeting_type AS (
        greeting text
    );
    CREATE DOMAIN greet.greeting AS greet.greeting_type  CHECK((VALUE).greeting IS NOT NULL);

    CREATE TYPE greet.message_type AS (
        hello text
    );
    CREATE DOMAIN greet.message AS greet.message_type;


    CREATE OR REPLACE FUNCTION greet.greet(input greet.greeting, OUT output greet.message, OUT notifications text[]) AS $FUNCTION$
    BEGIN
        SELECT
            input.greeting || ' James!' AS hello
        INTO output;
        IF NOT FOUND THEN
            RAISE EXCEPTION 'UserFriendly: NO_SUCH_PERSON';
        END IF;
    END
    $FUNCTION$ LANGUAGE plpgsql;


    UPDATE infrastructure.migrations SET completed_at = clock_timestamp() WHERE schema = current_setting('infrastructure.schema') AND version = current_setting('infrastructure.migration')::integer;
END$$;
