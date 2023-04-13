# Todo


- [ ] Make the domains part of the config
- [ ] Enable mod_md for domains as a config flag e.g. `if [ ! -z $MD_USER ] then ...`
- [ ] Single endpoint that allows multiple function calls. Needs a mapping of names to input types.

      ```
      [
          {"api": "greet.greet", "payload": {}},
          ...
      ]
      ```

      Then the schema can use oneOf	


      ```
      /pets:
        patch:
          requestBody:
            content:
              application/json:
                schema:
                  oneOf:
                    - $ref: '#/components/schemas/Cat'
                    - $ref: '#/components/schemas/Dog'
                  discriminator:
                    propertyName: pet_type
      ```
