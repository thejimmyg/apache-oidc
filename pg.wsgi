import psycopg2.pool, psycopg2.sql
pool = psycopg2.pool.ThreadedConnectionPool(1, 20, user='infrastructureuser', password='md', database='md', host='localhost', port='5432')

def application(environ, start_response):
    try: 
        conn = pool.getconn()
        cur = conn.cursor()
        # https://www.psycopg.org/docs/sql.html 
        cur.execute(
            psycopg2.sql.SQL('SELECT row_to_json(r.output) FROM {schema}.{function}(json_populate_record(null::{schema}.{type}, %s)) r;').format(
                schema=psycopg2.sql.Identifier('greet'),
                function=psycopg2.sql.Identifier('greet'),
                type=psycopg2.sql.Identifier('greeting'+'_type')),
            (environ['wsgi.input'].read().decode('utf8'),)
        )
        result = cur.fetchone()[0]
        cur.close()
    finally:
        pool.putconn(conn)
    status = '200 OK'
    output = str(result).encode('ascii')
    response_headers = [('Content-type', 'text/plain'), ('Content-Length', str(len(output)))]
    start_response(status, response_headers)
    return [output]
