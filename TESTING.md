# Testing

## OIDC

```sh
sudo apt install -y glewlwyd
```

Update the external URL and debug level in `/etc/glewlwyd/glewlwyd.conf`:

```
external_url="https://oidc.example.com/"
log_level="DEBUG"
```

Then:

```sh
sudo service glewlwyd restart
# Otherwise Apache seems to redirect to localhost, no ide why!
sudo service apache2 restart
```

Then on both the machine and the server set up your `/etc/hosts`:

```
35.179.46.241 doc.api.example.com api.example.com www.example.com example.com oidc.example.com
```



### Debgugging

Add something like to an apache vhost:

```
LogLevel alert auth_openidc:trace6
```

Then restart:

```sh
sudo service apache2 restart
```

Now more detailed OIDC info will be in the error log:

```sh
sudo tail -f /var/log/apache2/error.log
```

For Glewlwyd:

```sh
sudo tail -f /var/log/glewlwyd.log
```

### Manual Setup

Log into https://oidc.example.com with username `admin` and password `password`.

Set up OIDC, Client and User.

The Client should have:

* Client: `client`
* Secret: `123`
* Token endpoint auth method: `client_secret_basic`
* Scope: `openid`
* Redirect URI: `http://www.example.com/secure/redirect_uri`
* Authorization types: `code`

The user can be any username and password you like.

The OpenID plugin should have name `oidc` and the private and public keys that you can generate with:

```
openssl genrsa -out private-rsa.key 4096
openssl rsa -in private-rsa.key -outform PEM -pubout -out public-rsa.pem
```

Everything else can be left as the default.

Once this is all working you can dump the SQLite data like this:

```
sqlite3 /var/lib/dbconfig-common/sqlite3/glewlwyd/glewlwyd .dump > backup.sql
```

Then use it for next time.

### Automatic Setup

Once you have a `backup.sql` you can restore it like this:

```sh
sqlite3 new.db < backup.sql
chmod o+w new.db
chown glewlwyd:glewlwyd new.db
sudo mv /var/lib/dbconfig-common/sqlite3/glewlwyd/glewlwyd current.db
sudo mv new.db /var/lib/dbconfig-common/sqlite3/glewlwyd/glewlwyd
sudo service glewlwyd restart
```

## Testing:

Visit http://example.com/some/path. You will be redirected to http://www.example.com/some/path and from there to the OIDC login page.

Once logged in you should see the server environment coming from `env.wsgi`. One of the keys is the access token.

You can then use it like this to test the API:

```
export TOKEN=eyJ...
curl -H "Authorization: Bearer $TOKEN" http://api.example.com
```
