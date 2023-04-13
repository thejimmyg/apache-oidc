PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE g_user_module_instance (
  gumi_id INTEGER PRIMARY KEY AUTOINCREMENT,
  gumi_module TEXT NOT NULL,
  gumi_order INTEGER NOT NULL,
  gumi_name TEXT NOT NULL,
  gumi_display_name TEXT DEFAULT '',
  gumi_parameters TEXT,
  gumi_readonly INTEGER DEFAULT 0,
  gumi_multiple_passwords INTEGER DEFAULT 0,
  gumi_enabled INTEGER DEFAULT 1
);
INSERT INTO g_user_module_instance VALUES(1,'database',0,'database','Database backend','{"use-glewlwyd-connection":true,"data-format":{"picture":{"multiple":false,"read":true,"write":true,"profile-read":true,"profile-write":true},"reset-credentials-code":{"multiple":false,"read":true,"write":true,"profile-read":false,"profile-write":false}}}',0,0,1);
CREATE TABLE g_user_auth_scheme_module_instance (
  guasmi_id INTEGER PRIMARY KEY AUTOINCREMENT,
  guasmi_module TEXT NOT NULL,
  guasmi_expiration INTEGER NOT NULL DEFAULT 0,
  guasmi_max_use INTEGER DEFAULT 0, -- 0: unlimited
  guasmi_allow_user_register INTEGER DEFAULT 1,
  guasmi_name TEXT NOT NULL,
  guasmi_display_name TEXT DEFAULT '',
  guasmi_parameters TEXT,
  guasmi_enabled INTEGER DEFAULT 1
);
CREATE TABLE g_client_module_instance (
  gcmi_id INTEGER PRIMARY KEY AUTOINCREMENT,
  gcmi_module TEXT NOT NULL,
  gcmi_order INTEGER NOT NULL,
  gcmi_name TEXT NOT NULL,
  gcmi_display_name TEXT DEFAULT '',
  gcmi_parameters TEXT,
  gcmi_readonly INTEGER DEFAULT 0,
  gcmi_enabled INTEGER DEFAULT 1
);
INSERT INTO g_client_module_instance VALUES(1,'database',0,'database','Database backend','{"use-glewlwyd-connection":true,"data-format":{"redirect_uri":{"multiple":true,"read":true,"write":true},"authorization_type":{"multiple":true,"read":true,"write":true},"client_secret":{"read":true,"write":true},"pubkey":{"read":true,"write":true},"jwks":{"convert":"jwks","read":true,"write":true},"jwks_uri":{"read":true,"write":true},"post_logout_redirect_uris":{"multiple":true,"read":true,"write":true},"token_endpoint_auth_method":{"multiple":false,"read":true,"write":true},"resource":{"multiple":true,"read":true,"write":true},"authorization_data_types":{"multiple":true,"read":true,"write":true}}}',0,1);
CREATE TABLE g_plugin_module_instance (
  gpmi_id INTEGER PRIMARY KEY AUTOINCREMENT,
  gpmi_module TEXT NOT NULL,
  gpmi_name TEXT NOT NULL,
  gpmi_display_name TEXT DEFAULT '',
  gpmi_parameters TEXT,
  gpmi_enabled INTEGER DEFAULT 1
);
INSERT INTO g_plugin_module_instance VALUES(1,'oidc','oidc','OIDC','{"jwt-type":"rsa","jwt-key-size":"256","jwks-uri":"","jwks-private":"","default-kid":"","client-sign_kid-parameter":"","jwks-public":"","key":"-----BEGIN RSA PRIVATE KEY-----\n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\n-----END RSA PRIVATE KEY-----\n","cert":"-----BEGIN PUBLIC KEY-----\nMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAt6vtAja7fftQ/VRvkQzr\nLsxaLijet023HZ3apa9PAQWtEkM7+gcr+t6E69zonOGbJv3pQjGb55WfAoGhsE0h\nQkaW8STayNlKE12PM+NIqajVfvkOT2m/yeHuSQrQ8VuNw4ONUuervQ77XFCk/pkj\n+CQCDyeYwZofkX2JzSbuimTP9kuZtHb8LujchIZCeMGsyAtwC3peC8xO4Ve5yrzC\nUyPw27NLfFe70MqNSgA4bHbDn6OU3PSNgp8v+QFmnE0QAN+s85D11iGys10HdzhG\noi7zR8UvA6TOTqFmx8n8O+Obguo6gJTxDMCEhB52xpI/zavr6WRbnaXVrSdF0ZDN\nbRxe2c8CwkqtDLasVU1QWkdgMfvcga5Xc+60F2Jmk8a8aGIwixAo97kLC+NbuGy9\n+NUZ6s89UQDhkKKqDXi/LppieuTzu3hGGz+I86oDTPP9aq83SJmtG4q/CF2kspCY\nsY/w8okskIyWsUshWMUnH/sF9B6ZIHT87ccYHgZGft1bPg4JMmyXWc5F3XeBIquI\ndrkq3RUXVWDcW4WTkkHA5ZxSZIIRo52G2rdeTbqT7nits8p1a2y5jHrKNAOnxmej\nOCxdrxHLQxeBScxWXsqJrnsQs9CV+Eis6BRbzLTOZ2d06VNibsft6wpUEaQQww9U\n47EF62VxKrHBGHXcnu59+F0CAwEAAQ==\n-----END PUBLIC KEY-----\n","access-token-duration":3600,"refresh-token-duration":1209600,"code-duration":600,"refresh-token-rolling":true,"refresh-token-one-use":"never","client-refresh-token-one-use-parameter":"refresh-token-one-use","allow-non-oidc":false,"auth-type-code-enabled":true,"auth-type-code-revoke-replayed":false,"auth-type-token-enabled":true,"auth-type-id-token-enabled":true,"auth-type-none-enabled":true,"auth-type-password-enabled":false,"auth-type-client-enabled":true,"auth-type-device-enabled":false,"auth-type-refresh-enabled":true,"scope":[],"additional-parameters":[],"claims":[],"service-documentation":"https://github.com/babelouest/glewlwyd/tree/master/docs","op-policy-uri":"","op-tos-uri":"","jwks-show":true,"jwks-x5c":[],"request-parameter-allow":true,"request-uri-allow-https-non-secure":false,"secret-type":"pairwise","address-claim":{"type":"no","formatted":"","street_address":"","locality":"","region":"","postal_code":"","country":"","mandatory":false},"name-claim":"on-demand","name-claim-scope":[],"email-claim":"no","email-claim-scope":[],"scope-claim":"no","scope-claim-scope":[],"allowed-scope":["openid"],"pkce-allowed":false,"pkce-method-plain-allowed":false,"introspection-revocation-allowed":false,"introspection-revocation-auth-scope":[],"introspection-revocation-allow-target-client":true,"register-client-allowed":false,"register-client-auth-scope":[],"register-client-credentials-scope":[],"register-client-management-allowed":true,"register-resource-specify-allowed":false,"register-resource-default":[],"session-management-allowed":false,"client-pubkey-parameter":"","client-jwks-parameter":"jwks","client-jwks_uri-parameter":"jwks_uri","request-maximum-exp":3600,"encrypt-out-token-allow":false,"client-enc-parameter":"enc","client-alg-parameter":"alg","client-alg_kid-parameter":"alg_kid","client-encrypt_code-parameter":"encrypt_code","client-encrypt_at-parameter":"encrypt_at","client-encrypt_userinfo-parameter":"encrypt_userinfo","client-encrypt_id_token-parameter":"encrypt_id_token","client-encrypt_refresh_token-parameter":"encrypt_refresh_token","client-encrypt_introspection-parameter":"encrypt_introspection","device-authorization-expiration":600,"device-authorization-interval":5,"client-cert-header-name":"SSL_CLIENT_CERT","client-cert-use-endpoint-aliases":false,"client-cert-self-signed-allowed":false,"oauth-dpop-allowed":false,"oauth-dpop-iat-duration":10,"resource-allowed":false,"resource-scope":{},"resource-client-property":"","resource-scope-and-client-property":false,"resource-change-allowed":false,"oauth-rar-allowed":false,"rar-types-client-property":"authorization_data_types","rar-allow-auth-unsigned":false,"rar-allow-auth-unencrypted":true,"rar-types":{},"oauth-par-allowed":false,"oauth-par-duration":90,"oauth-par-required":false,"oauth-par-request_uri-prefix":"urn:ietf:params:oauth:request_uri:","prompt-continue-client-property":"","restrict-scope-client-property":"","jwks-public-uri":"","iss":"https://oidc.example.com/api/oidc/"}',1);
CREATE TABLE g_user_session (
  gus_id INTEGER PRIMARY KEY AUTOINCREMENT,
  gus_session_hash TEXT NOT NULL,
  gus_user_agent TEXT,
  gus_issued_for TEXT, -- IP address or hostname
  gus_username TEXT NOT NULL,
  gus_expiration TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  gus_last_login TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  gus_current INTEGER,
  gus_enabled INTEGER DEFAULT 1
);
INSERT INTO g_user_session VALUES(1,'{SHA512}Pj0ZmtnjVUlSQrZGL13OQed8y92R1LyWMzrNLnZzuPbUUUGIDOI6cKl34SdGV43OoqrMt/KldLl5Uh/fb/+Hgg==','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36','77.89.151.62 - 77.89.151.62','admin',1683793033,1681373833,0,0);
INSERT INTO g_user_session VALUES(2,'{SHA512}DU3EqW7zYfUjYTJiX9ajcuRv1RwScNYyPSLb0tTN0zFHSKEa+lF9XJglRKxuOPRf/u8pFAodmBx9oIU4xIOxew==','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36','77.89.151.62 - 77.89.151.62','admin',1683793605,1681374405,0,0);
INSERT INTO g_user_session VALUES(3,'{SHA512}nxYgVfzbAXLpJCLFWAyAarEnxgoZ+bP2K8/ooawlfm+mZfKI25XeJBMoNT1NlQzpjFapZAwMedAvcW4cb0m8og==','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36','77.89.151.62 - 77.89.151.62','james',1683797653,1681378453,1,1);
CREATE TABLE g_user_session_scheme (
  guss_id INTEGER PRIMARY KEY AUTOINCREMENT,
  gus_id INTEGER NOT NULL,
  guasmi_id INTEGER DEFAULT NULL, -- NULL means scheme 'password'
  guss_expiration TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  guss_last_login TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  guss_use_counter INTEGER DEFAULT 0,
  guss_enabled INTEGER DEFAULT 1,
  FOREIGN KEY(gus_id) REFERENCES g_user_session(gus_id) ON DELETE CASCADE,
  FOREIGN KEY(guasmi_id) REFERENCES g_user_auth_scheme_module_instance(guasmi_id) ON DELETE CASCADE
);
INSERT INTO g_user_session_scheme VALUES(1,1,NULL,1683965833,1681373833,0,1);
INSERT INTO g_user_session_scheme VALUES(2,2,NULL,1683966405,1681374405,0,1);
INSERT INTO g_user_session_scheme VALUES(3,3,NULL,1683970453,1681378453,1,1);
CREATE TABLE g_scope (
  gs_id INTEGER PRIMARY KEY AUTOINCREMENT,
  gs_name TEXT NOT NULL UNIQUE,
  gs_display_name TEXT DEFAULT '',
  gs_description TEXT,
  gs_password_required INTEGER DEFAULT 1,
  gs_password_max_age INTEGER DEFAULT 0,
  gs_enabled INTEGER DEFAULT 1
);
INSERT INTO g_scope VALUES(1,'g_admin','Glewlwyd administration','Access to Glewlwyd''s administration API',1,600,1);
INSERT INTO g_scope VALUES(2,'g_profile','Glewlwyd profile','Access to the user''s profile API',1,600,1);
INSERT INTO g_scope VALUES(3,'openid','Open ID','Open ID Connect scope',0,0,1);
CREATE TABLE g_scope_group (
  gsg_id INTEGER PRIMARY KEY AUTOINCREMENT,
  gs_id INTEGER,
  gsg_name TEXT NOT NULL,
  gsg_scheme_required INTEGER DEFAULT 1,
  FOREIGN KEY(gs_id) REFERENCES g_scope(gs_id) ON DELETE CASCADE
);
CREATE TABLE g_scope_group_auth_scheme_module_instance (
  gsgasmi_id INTEGER PRIMARY KEY AUTOINCREMENT,
  gsg_id INTEGER NOT NULL,
  guasmi_id INTEGER NOT NULL,
  FOREIGN KEY(gsg_id) REFERENCES g_scope_group(gsg_id) ON DELETE CASCADE,
  FOREIGN KEY(guasmi_id) REFERENCES g_user_auth_scheme_module_instance(guasmi_id) ON DELETE CASCADE
);
CREATE TABLE g_client_user_scope (
  gcus_id INTEGER PRIMARY KEY AUTOINCREMENT,
  gs_id INTEGER NOT NULL,
  gcus_username TEXT NOT NULL,
  gcus_client_id TEXT NOT NULL,
  gcus_granted TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  gcus_enabled INTEGER DEFAULT 1,
  FOREIGN KEY(gs_id) REFERENCES g_scope(gs_id) ON DELETE CASCADE
);
CREATE TABLE g_api_key (
  gak_id INTEGER PRIMARY KEY AUTOINCREMENT,
  gak_token_hash TEXT NOT NULL,
  gak_counter INTEGER DEFAULT 0,
  gak_username TEXT NOT NULL,
  gak_issued_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  gak_issued_for TEXT, -- IP address or hostname
  gak_user_agent TEXT,
  gak_enabled INTEGER DEFAULT 1
);
CREATE TABLE g_client (
  gc_id INTEGER PRIMARY KEY AUTOINCREMENT,
  gc_client_id TEXT NOT NULL UNIQUE,
  gc_name TEXT DEFAULT '',
  gc_description TEXT DEFAULT '',
  gc_confidential INTEGER DEFAULT 0,
  gc_password TEXT,
  gc_enabled INTEGER DEFAULT 1
);
INSERT INTO g_client VALUES(1,'client','Client','',0,'',1);
CREATE TABLE g_client_scope (
  gcs_id INTEGER PRIMARY KEY AUTOINCREMENT,
  gcs_name TEXT NOT NULL UNIQUE
);
INSERT INTO g_client_scope VALUES(1,'openid');
CREATE TABLE g_client_scope_client (
  gcsu_id INTEGER PRIMARY KEY AUTOINCREMENT,
  gc_id INTEGER,
  gcs_id INTEGER,
  FOREIGN KEY(gc_id) REFERENCES g_client(gc_id) ON DELETE CASCADE,
  FOREIGN KEY(gcs_id) REFERENCES g_client_scope(gcs_id) ON DELETE CASCADE
);
INSERT INTO g_client_scope_client VALUES(1,1,1);
CREATE TABLE g_client_property (
  gcp_id INTEGER PRIMARY KEY AUTOINCREMENT,
  gc_id INTEGER,
  gcp_name TEXT NOT NULL,
  gcp_value TEXT DEFAULT NULL,
  FOREIGN KEY(gc_id) REFERENCES g_client(gc_id) ON DELETE CASCADE
);
INSERT INTO g_client_property VALUES(1,1,'token_endpoint_auth_method','client_secret_basic');
INSERT INTO g_client_property VALUES(2,1,'client_secret','123');
INSERT INTO g_client_property VALUES(3,1,'jwks_uri','');
INSERT INTO g_client_property VALUES(4,1,'pubkey','');
INSERT INTO g_client_property VALUES(5,1,'enc','');
INSERT INTO g_client_property VALUES(6,1,'alg','');
INSERT INTO g_client_property VALUES(7,1,'alg_kid','');
INSERT INTO g_client_property VALUES(8,1,'encrypt_code','');
INSERT INTO g_client_property VALUES(9,1,'encrypt_at','');
INSERT INTO g_client_property VALUES(10,1,'encrypt_userinfo','');
INSERT INTO g_client_property VALUES(11,1,'encrypt_id_token','');
INSERT INTO g_client_property VALUES(12,1,'encrypt_refresh_token','');
INSERT INTO g_client_property VALUES(13,1,'authorization_type','code');
INSERT INTO g_client_property VALUES(14,1,'sector_identifier_uri','');
INSERT INTO g_client_property VALUES(15,1,'source','database');
INSERT INTO g_client_property VALUES(16,1,'redirect_uri','http://www.example.com/secure/redirect_uri');
CREATE TABLE g_user (
  gu_id INTEGER PRIMARY KEY AUTOINCREMENT,
  gu_username TEXT NOT NULL UNIQUE,
  gu_name TEXT DEFAULT '',
  gu_email TEXT DEFAULT '',
  gu_enabled INTEGER DEFAULT 1
);
INSERT INTO g_user VALUES(1,'admin','The Administrator','',1);
INSERT INTO g_user VALUES(2,'james','James','',1);
CREATE TABLE g_user_scope (
  gus_id INTEGER PRIMARY KEY AUTOINCREMENT,
  gus_name TEXT NOT NULL UNIQUE
);
INSERT INTO g_user_scope VALUES(1,'g_admin');
INSERT INTO g_user_scope VALUES(2,'g_profile');
INSERT INTO g_user_scope VALUES(3,'openid');
CREATE TABLE g_user_scope_user (
  gusu_id INTEGER PRIMARY KEY AUTOINCREMENT,
  gu_id INTEGER,
  gus_id INTEGER,
  FOREIGN KEY(gu_id) REFERENCES g_user(gu_id) ON DELETE CASCADE,
  FOREIGN KEY(gus_id) REFERENCES g_user_scope(gus_id) ON DELETE CASCADE
);
INSERT INTO g_user_scope_user VALUES(1,1,1);
INSERT INTO g_user_scope_user VALUES(2,1,2);
INSERT INTO g_user_scope_user VALUES(3,2,3);
CREATE TABLE g_user_property (
  gup_id INTEGER PRIMARY KEY AUTOINCREMENT,
  gu_id INTEGER,
  gup_name TEXT NOT NULL,
  gup_value TEXT DEFAULT NULL,
  FOREIGN KEY(gu_id) REFERENCES g_user(gu_id) ON DELETE CASCADE
);
INSERT INTO g_user_property VALUES(1,2,'picture','');
INSERT INTO g_user_property VALUES(2,2,'source','database');
CREATE TABLE g_user_password (
  guw_id INTEGER PRIMARY KEY AUTOINCREMENT,
  gu_id INTEGER,
  guw_password TEXT,
  FOREIGN KEY(gu_id) REFERENCES g_user(gu_id) ON DELETE CASCADE
);
INSERT INTO g_user_password VALUES(1,1,'fOfvZC/wR2cUSTWbW6YZueGyyDuFqwkoFlcNlRYWJscxYTVOVFJ3VWFHdVJQT0pU');
INSERT INTO g_user_password VALUES(2,2,'+fLMl5ID24yAinLD2z5Jy3UAdf/aQsBkkpNoLgxxYCFUMHdnblk1V1R1dVRXYjRs');
CREATE TABLE gpg_code (
  gpgc_id INTEGER PRIMARY KEY AUTOINCREMENT,
  gpgc_plugin_name TEXT NOT NULL,
  gpgc_username TEXT NOT NULL,
  gpgc_client_id TEXT NOT NULL,
  gpgc_redirect_uri TEXT NOT NULL,
  gpgc_code_hash TEXT NOT NULL,
  gpgc_expires_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  gpgc_issued_for TEXT, -- IP address or hostname
  gpgc_user_agent TEXT,
  gpgc_code_challenge TEXT,
  gpgc_enabled INTEGER DEFAULT 1
);
CREATE TABLE gpg_code_scope (
  gpgcs_id INTEGER PRIMARY KEY AUTOINCREMENT,
  gpgc_id INTEGER,
  gpgcs_scope TEXT NOT NULL,
  FOREIGN KEY(gpgc_id) REFERENCES gpg_code(gpgc_id) ON DELETE CASCADE
);
CREATE TABLE gpg_refresh_token (
  gpgr_id INTEGER PRIMARY KEY AUTOINCREMENT,
  gpgr_plugin_name TEXT NOT NULL,
  gpgr_authorization_type INTEGER NOT NULL, -- 0: Authorization Code Grant, 1: Implicit Grant, 2: Resource Owner Password Credentials Grant, 3: Client Credentials Grant
  gpgc_id INTEGER DEFAULT NULL,
  gpgr_username TEXT NOT NULL,
  gpgr_client_id TEXT,
  gpgr_issued_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  gpgr_expires_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  gpgr_last_seen TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  gpgr_duration INTEGER,
  gpgr_rolling_expiration INTEGER DEFAULT 0,
  gpgr_issued_for TEXT, -- IP address or hostname
  gpgr_user_agent TEXT,
  gpgr_token_hash TEXT NOT NULL,
  gpgr_enabled INTEGER DEFAULT 1,
  FOREIGN KEY(gpgc_id) REFERENCES gpg_code(gpgc_id) ON DELETE CASCADE
);
CREATE TABLE gpg_refresh_token_scope (
  gpgrs_id INTEGER PRIMARY KEY AUTOINCREMENT,
  gpgr_id INTEGER,
  gpgrs_scope TEXT NOT NULL,
  FOREIGN KEY(gpgr_id) REFERENCES gpg_refresh_token(gpgr_id) ON DELETE CASCADE
);
CREATE TABLE gpg_access_token (
  gpga_id INTEGER PRIMARY KEY AUTOINCREMENT,
  gpga_plugin_name TEXT NOT NULL,
  gpga_authorization_type INTEGER NOT NULL, -- 0: Authorization Code Grant, 1: Implicit Grant, 2: Resource Owner Password Credentials Grant, 3: Client Credentials Grant
  gpgr_id INTEGER DEFAULT NULL,
  gpga_username TEXT,
  gpga_client_id TEXT,
  gpga_issued_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  gpga_issued_for TEXT, -- IP address or hostname
  gpga_user_agent TEXT,
  gpga_token_hash TEXT NOT NULL,
  gpga_enabled INTEGER DEFAULT 1,
  FOREIGN KEY(gpgr_id) REFERENCES gpg_refresh_token(gpgr_id) ON DELETE CASCADE
);
CREATE TABLE gpg_access_token_scope (
  gpgas_id INTEGER PRIMARY KEY AUTOINCREMENT,
  gpga_id INT(11),
  gpgas_scope TEXT NOT NULL,
  FOREIGN KEY(gpga_id) REFERENCES gpg_access_token(gpga_id) ON DELETE CASCADE
);
CREATE TABLE gpg_device_authorization (
  gpgda_id INTEGER PRIMARY KEY AUTOINCREMENT,
  gpgda_plugin_name TEXT NOT NULL,
  gpgda_client_id TEXT NOT NULL,
  gpgda_username TEXT,
  gpgda_created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  gpgda_expires_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  gpgda_issued_for TEXT, -- IP address or hostname of the deice client
  gpgda_device_code_hash TEXT NOT NULL,
  gpgda_user_code_hash TEXT NOT NULL,
  gpgda_status INTEGER DEFAULT 0, -- 0: created, 1: user verified, 2 device completed, 3 disabled
  gpgda_last_check TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE gpg_device_authorization_scope (
  gpgdas_id INTEGER PRIMARY KEY AUTOINCREMENT,
  gpgda_id INTEGER,
  gpgdas_scope TEXT NOT NULL,
  gpgdas_allowed INTEGER DEFAULT 0,
  FOREIGN KEY(gpgda_id) REFERENCES gpg_device_authorization(gpgda_id) ON DELETE CASCADE
);
CREATE TABLE gpo_code (
  gpoc_id INTEGER PRIMARY KEY AUTOINCREMENT,
  gpoc_plugin_name TEXT NOT NULL,
  gpoc_authorization_type INTEGER NOT NULL,
  gpoc_username TEXT NOT NULL,
  gpoc_client_id TEXT NOT NULL,
  gpoc_redirect_uri TEXT NOT NULL,
  gpoc_code_hash TEXT NOT NULL,
  gpoc_nonce TEXT,
  gpoc_resource TEXT,
  gpoc_claims_request TEXT DEFAULT NULL,
  gpoc_authorization_details TEXT DEFAULT NULL,
  gpoc_expires_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  gpoc_issued_for TEXT, -- IP address or hostname
  gpoc_user_agent TEXT,
  gpoc_code_challenge TEXT,
  gpoc_enabled INTEGER DEFAULT 1
);
INSERT INTO gpo_code VALUES(1,'oidc',1,'james','client','http://www.example.com/secure/redirect_uri','{SHA512}FxDVVO7Io53ybBBZSnNIalbOtzD3jwWfvgh9P7qUb9b9bckbTj+Wf7CtvSg/XZS6+rAbvi8JTY520EE77fNZGA==','jMxKtSPDinpS_Bwsz4iA0eYnBF8i1dhtqgvqsQXDqjU',NULL,'',NULL,1681379054,'77.89.151.62 - 77.89.151.62','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36','',0);
CREATE TABLE gpo_code_scope (
  gpocs_id INTEGER PRIMARY KEY AUTOINCREMENT,
  gpoc_id INTEGER,
  gpocs_scope TEXT NOT NULL,
  FOREIGN KEY(gpoc_id) REFERENCES gpo_code(gpoc_id) ON DELETE CASCADE
);
INSERT INTO gpo_code_scope VALUES(1,1,'openid');
CREATE TABLE gpo_code_scheme (
  gpoch_id INTEGER PRIMARY KEY AUTOINCREMENT,
  gpoc_id INTEGER,
  gpoch_scheme_module TEXT NOT NULL,
  FOREIGN KEY(gpoc_id) REFERENCES gpo_code(gpoc_id) ON DELETE CASCADE
);
INSERT INTO gpo_code_scheme VALUES(1,1,'session');
CREATE TABLE gpo_refresh_token (
  gpor_id INTEGER PRIMARY KEY AUTOINCREMENT,
  gpor_plugin_name TEXT NOT NULL,
  gpor_authorization_type INTEGER NOT NULL,
  gpoc_id INTEGER DEFAULT NULL,
  gpor_username TEXT NOT NULL,
  gpor_client_id TEXT,
  gpor_resource TEXT,
  gpor_claims_request TEXT DEFAULT NULL,
  gpor_authorization_details TEXT DEFAULT NULL,
  gpor_issued_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  gpor_expires_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  gpor_last_seen TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  gpor_duration INTEGER,
  gpor_rolling_expiration INTEGER DEFAULT 0,
  gpor_issued_for TEXT, -- IP address or hostname
  gpor_user_agent TEXT,
  gpor_token_hash TEXT NOT NULL,
  gpor_jti TEXT,
  gpor_dpop_jkt TEXT,
  gpor_enabled INTEGER DEFAULT 1,
  FOREIGN KEY(gpoc_id) REFERENCES gpo_code(gpoc_id) ON DELETE CASCADE
);
INSERT INTO gpo_refresh_token VALUES(1,'oidc',0,1,'james','client',NULL,'',NULL,1681378455,1682588055,1681378455,1209600,1,'127.0.0.1 - 127.0.0.1','mod_auth_openidc','{SHA512}6f1Oc6rakLy4gs3Yyh7JKbDIdZTEOkCCN8HGLdEAzBawHGNbBPYcwN6kdX6Jv8EVh6E7zjyrpGeAnK9r/Tdf2A==',NULL,NULL,1);
CREATE TABLE gpo_refresh_token_scope (
  gpors_id INTEGER PRIMARY KEY AUTOINCREMENT,
  gpor_id INTEGER,
  gpors_scope TEXT NOT NULL,
  FOREIGN KEY(gpor_id) REFERENCES gpo_refresh_token(gpor_id) ON DELETE CASCADE
);
INSERT INTO gpo_refresh_token_scope VALUES(1,1,'openid');
CREATE TABLE gpo_access_token (
  gpoa_id INTEGER PRIMARY KEY AUTOINCREMENT,
  gpoa_plugin_name TEXT NOT NULL,
  gpoa_authorization_type INTEGER NOT NULL,
  gpor_id INTEGER DEFAULT NULL,
  gpoa_username TEXT,
  gpoa_client_id TEXT,
  gpoa_resource TEXT,
  gpoa_issued_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  gpoa_issued_for TEXT, -- IP address or hostname
  gpoa_user_agent TEXT,
  gpoa_token_hash TEXT NOT NULL,
  gpoa_jti TEXT,
  gpoa_authorization_details TEXT DEFAULT NULL,
  gpoa_enabled INTEGER DEFAULT 1,
  FOREIGN KEY(gpor_id) REFERENCES gpo_refresh_token(gpor_id) ON DELETE CASCADE
);
INSERT INTO gpo_access_token VALUES(1,'oidc',0,1,'james','client',NULL,1681378455,'127.0.0.1 - 127.0.0.1','mod_auth_openidc','{SHA512}94TMR254ajseTNVGyn7Y86Ih5fCkrATp+Gj0f8ss50ATbTq3j57/vcAkH5UYqn14eV5/P/Lvsh056n7aQRhr7Q==','meMGpTWnLjLPbNUz5CJdA3hubVMb7Iib',NULL,1);
CREATE TABLE gpo_access_token_scope (
  gpoas_id INTEGER PRIMARY KEY AUTOINCREMENT,
  gpoa_id INT(11),
  gpoas_scope TEXT NOT NULL,
  FOREIGN KEY(gpoa_id) REFERENCES gpo_access_token(gpoa_id) ON DELETE CASCADE
);
INSERT INTO gpo_access_token_scope VALUES(1,1,'openid');
CREATE TABLE gpo_id_token (
  gpoi_id INTEGER PRIMARY KEY AUTOINCREMENT,
  gpoi_plugin_name TEXT NOT NULL,
  gpoi_authorization_type INTEGER NOT NULL,
  gpoi_username TEXT,
  gpoi_client_id TEXT,
  gpoi_issued_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  gpoi_issued_for TEXT, -- IP address or hostname
  gpoi_user_agent TEXT,
  gpoi_hash TEXT,
  gpoi_enabled INTEGER DEFAULT 1
);
INSERT INTO gpo_id_token VALUES(1,'oidc',0,'james','client',1681378455,'127.0.0.1 - 127.0.0.1','mod_auth_openidc','{SHA512}zNz2Z6V3vrLipxZ5vZp+AHA7roS0Yzj21FYHJeCtKOPuEpQLf6hVfL+oz+lc3WPHRXH32mmWhUAWN6rm2gHW1w==',1);
CREATE TABLE gpo_subject_identifier (
  gposi_id INTEGER PRIMARY KEY AUTOINCREMENT,
  gposi_plugin_name TEXT NOT NULL,
  gposi_username TEXT NOT NULL,
  gposi_client_id TEXT,
  gposi_sector_identifier_uri TEXT,
  gposi_sub TEXT NOT NULL
);
INSERT INTO gpo_subject_identifier VALUES(1,'oidc','myrddin',NULL,NULL,'bAi02UoapTNi2TMIYBYqVjZpaAzOq6aW');
INSERT INTO gpo_subject_identifier VALUES(2,'oidc','james',NULL,NULL,'lsf3kByUpixJsjQF5qBk8B6XeUvhs174');
CREATE TABLE gpo_client_registration (
  gpocr_id INTEGER PRIMARY KEY AUTOINCREMENT,
  gpocr_plugin_name TEXT NOT NULL,
  gpocr_cient_id TEXT NOT NULL,
  gpocr_management_at_hash TEXT,
  gpocr_created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  gpoa_id INTEGER,
  gpocr_issued_for TEXT, -- IP address or hostname
  gpocr_user_agent TEXT,
  FOREIGN KEY(gpoa_id) REFERENCES gpo_access_token(gpoa_id) ON DELETE CASCADE
);
CREATE TABLE gpo_client_token_request (
  gpoctr_id INTEGER PRIMARY KEY AUTOINCREMENT,
  gpoctr_plugin_name TEXT NOT NULL,
  gpoctr_cient_id TEXT NOT NULL,
  gpoctr_created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  gpoctr_issued_for TEXT, -- IP address or hostname
  gpoctr_jti_hash TEXT
);
CREATE TABLE gpo_device_authorization (
  gpoda_id INTEGER PRIMARY KEY AUTOINCREMENT,
  gpoda_plugin_name TEXT NOT NULL,
  gpoda_client_id TEXT NOT NULL,
  gpoda_resource TEXT,
  gpoda_username TEXT,
  gpoda_created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  gpoda_expires_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  gpoda_issued_for TEXT, -- IP address or hostname of the deice client
  gpoda_device_code_hash TEXT NOT NULL,
  gpoda_user_code_hash TEXT NOT NULL,
  gpoda_status INTEGER DEFAULT 0, -- 0: created, 1: user verified, 2 device completed, 3 disabled
  gpoda_authorization_details TEXT DEFAULT NULL,
  gpoda_last_check TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE gpo_device_authorization_scope (
  gpodas_id INTEGER PRIMARY KEY AUTOINCREMENT,
  gpoda_id INTEGER,
  gpodas_scope TEXT NOT NULL,
  gpodas_allowed INTEGER DEFAULT 0,
  FOREIGN KEY(gpoda_id) REFERENCES gpo_device_authorization(gpoda_id) ON DELETE CASCADE
);
CREATE TABLE gpo_device_scheme (
  gpodh_id INTEGER PRIMARY KEY AUTOINCREMENT,
  gpoda_id INTEGER,
  gpodh_scheme_module TEXT NOT NULL,
  FOREIGN KEY(gpoda_id) REFERENCES gpo_device_authorization(gpoda_id) ON DELETE CASCADE
);
CREATE TABLE gpo_dpop (
  gpod_id INTEGER PRIMARY KEY AUTOINCREMENT,
  gpod_plugin_name TEXT NOT NULL,
  gpod_client_id TEXT NOT NULL,
  gpod_jti_hash TEXT NOT NULL,
  gpod_jkt TEXT NOT NULL,
  gpod_htm TEXT NOT NULL,
  gpod_htu TEXT NOT NULL,
  gpod_iat TIMESTAMP NOT NULL,
  gpod_last_seen TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE gpo_rar (
  gporar_id INTEGER PRIMARY KEY AUTOINCREMENT,
  gporar_plugin_name TEXT NOT NULL,
  gporar_client_id TEXT NOT NULL,
  gporar_type TEXT NOT NULL,
  gporar_username TEXT,
  gporar_consent INTEGER DEFAULT 0,
  gporar_enabled INTEGER DEFAULT 1
);
CREATE TABLE gpo_par (
  gpop_id INTEGER PRIMARY KEY AUTOINCREMENT,
  gpop_plugin_name TEXT NOT NULL,
  gpop_response_type TEXT NOT NULL,
  gpop_state TEXT,
  gpop_username TEXT,
  gpop_client_id TEXT NOT NULL,
  gpop_redirect_uri TEXT NOT NULL,
  gpop_request_uri_hash TEXT NOT NULL,
  gpop_nonce TEXT,
  gpop_code_challenge TEXT,
  gpop_resource TEXT,
  gpop_claims_request TEXT DEFAULT NULL,
  gpop_authorization_details TEXT DEFAULT NULL,
  gpop_additional_parameters TEXT DEFAULT NULL,
  gpop_status INTEGER DEFAULT 0, -- 0 created, 1 validated, 2 completed
  gpop_expires_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  gpop_issued_for TEXT, -- IP address or hostname
  gpop_user_agent TEXT
);
CREATE TABLE gpo_par_scope (
  gpops_id INTEGER PRIMARY KEY AUTOINCREMENT,
  gpop_id INTEGER,
  gpops_scope TEXT NOT NULL,
  FOREIGN KEY(gpop_id) REFERENCES gpo_par(gpop_id) ON DELETE CASCADE
);
CREATE TABLE gs_code (
  gsc_id INTEGER PRIMARY KEY AUTOINCREMENT,
  gsc_mod_name TEXT NOT NULL,
  gsc_issued_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  gsc_username TEXT NOT NULL,
  gsc_enabled INTEGER DEFAULT 1,
  gsc_code_hash TEXT,
  gsc_result INTEGER DEFAULT 0
);
CREATE TABLE gs_webauthn_user (
  gswu_id INTEGER PRIMARY KEY AUTOINCREMENT,
  gswu_mod_name TEXT NOT NULL,
  gswu_username TEXT NOT NULL,
  gswu_user_id TEXT NOT NULL
);
CREATE TABLE gs_webauthn_credential (
  gswc_id INTEGER PRIMARY KEY AUTOINCREMENT,
  gswu_id INTEGER NOT NULL,
  gswc_session_hash TEXT NOT NULL,
  gswc_name TEXT,
  gswc_challenge_hash TEXT,
  gswc_credential_id TEXT,
  gswc_certificate TEXT DEFAULT NULL,
  gswc_public_key TEXT DEFAULT NULL,
  gswc_counter INTEGER DEFAULT 0,
  gswc_created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  gswc_status INTEGER DEFAULT 0, -- 0 new, 1 registered, 2 error, 3 disabled, 4 removed
  FOREIGN KEY(gswu_id) REFERENCES gs_webauthn_user(gswu_id) ON DELETE CASCADE
);
CREATE TABLE gs_webauthn_assertion (
  gswa_id INTEGER PRIMARY KEY AUTOINCREMENT,
  gswu_id INTEGER NOT NULL,
  gswc_id INTEGER,
  gswa_session_hash TEXT NOT NULL,
  gswa_challenge_hash TEXT,
  gswa_counter INTEGER DEFAULT 0,
  gswa_issued_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  gswa_status SMALLINT DEFAULT 0, -- 0 new, 1 verified, 2 not verified, 3 error
  gswa_mock SMALLINT DEFAULT 0,
  FOREIGN KEY(gswu_id) REFERENCES gs_webauthn_user(gswu_id) ON DELETE CASCADE,
  FOREIGN KEY(gswc_id) REFERENCES gs_webauthn_credential(gswc_id) ON DELETE CASCADE
);
CREATE TABLE gs_otp (
  gso_id INTEGER PRIMARY KEY AUTOINCREMENT,
  gso_mod_name TEXT NOT NULL,
  gso_issued_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  gso_last_used TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  gso_username TEXT NOT NULL,
  gso_otp_type INTEGER DEFAULT 0, -- 0 HOTP, 1 TOTP
  gso_secret TEXT NOT NULL,
  gso_hotp_moving_factor INTEGER,
  gso_totp_time_step_size INTEGER
);
CREATE TABLE gs_user_certificate (
  gsuc_id INTEGER PRIMARY KEY AUTOINCREMENT,
  gsuc_mod_name TEXT NOT NULL,
  gsuc_username TEXT NOT NULL,
  gsuc_enabled INTEGER DEFAULT 1,
  gsuc_x509_certificate_content TEXT DEFAULT NULL,
  gsuc_x509_certificate_id TEXT NOT NULL,
  gsuc_x509_certificate_dn TEXT NOT NULL,
  gsuc_x509_certificate_issuer_dn TEXT NOT NULL,
  gsuc_activation TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  gsuc_expiration TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  gsuc_last_used TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  gsuc_last_user_agent TEXT DEFAULT NULL
);
CREATE TABLE gpr_session (
  gprs_id INTEGER PRIMARY KEY AUTOINCREMENT,
  gprs_plugin_name TEXT NOT NULL,
  gprs_username TEXT NOT NULL,
  gprs_name TEXT,
  gprs_email TEXT,
  gprs_code_hash TEXT,
  gprs_callback_url TEXT DEFAULT NULL,
  gprs_password_set INTEGER DEFAULT 0,
  gprs_session_hash TEXT,
  gprs_token_hash TEXT,
  gprs_expires_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  gprs_issued_for TEXT, -- IP address or hostname
  gprs_user_agent TEXT,
  gprs_enabled INTEGER DEFAULT 1
);
CREATE TABLE gpr_update_email (
  gprue_id INTEGER PRIMARY KEY AUTOINCREMENT,
  gprue_plugin_name TEXT NOT NULL,
  gprue_username TEXT NOT NULL,
  gprue_email TEXT,
  gprue_token_hash TEXT,
  gprue_expires_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  gprue_issued_for TEXT, -- IP address or hostname
  gprue_user_agent TEXT,
  gprue_enabled INTEGER DEFAULT 1
);
CREATE TABLE gpr_reset_credentials_session (
  gprrcs_id INTEGER PRIMARY KEY AUTOINCREMENT,
  gprrcs_plugin_name TEXT NOT NULL,
  gprrcs_username TEXT NOT NULL,
  gprrcs_session_hash TEXT,
  gprrcs_callback_url TEXT DEFAULT NULL,
  gprrcs_expires_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  gprrcs_issued_for TEXT, -- IP address or hostname
  gprrcs_user_agent TEXT,
  gprrcs_enabled INTEGER DEFAULT 1
);
CREATE TABLE gpr_reset_credentials_email (
  gprrct_id INTEGER PRIMARY KEY AUTOINCREMENT,
  gprrct_plugin_name TEXT NOT NULL,
  gprrct_username TEXT NOT NULL,
  gprrct_token_hash TEXT,
  gprrct_callback_url TEXT DEFAULT NULL,
  gprrct_expires_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  gprrct_issued_for TEXT, -- IP address or hostname
  gprrct_user_agent TEXT,
  gprrct_enabled INTEGER DEFAULT 1
);
CREATE TABLE gs_oauth2_registration (
  gsor_id INTEGER PRIMARY KEY AUTOINCREMENT,
  gsor_mod_name TEXT NOT NULL,
  gsor_provider TEXT NOT NULL,
  gsor_created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  gsor_username TEXT NOT NULL,
  gsor_userinfo_sub TEXT
);
CREATE TABLE gs_oauth2_session (
  gsos_id INTEGER PRIMARY KEY AUTOINCREMENT,
  gsor_id INTEGER,
  gsos_created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  gsos_expires_at TIMESTAMP,
  gsos_state TEXT NOT NULL,
  gsos_session_export TEXT,
  gsos_status INTEGER DEFAULT 0, -- 0: registration, 1: authentication, 2: verified, 3: cancelled
  FOREIGN KEY(gsor_id) REFERENCES gs_oauth2_registration(gsor_id) ON DELETE CASCADE
);
DELETE FROM sqlite_sequence;
INSERT INTO sqlite_sequence VALUES('g_scope',3);
INSERT INTO sqlite_sequence VALUES('g_user_module_instance',1);
INSERT INTO sqlite_sequence VALUES('g_client_module_instance',1);
INSERT INTO sqlite_sequence VALUES('g_user',2);
INSERT INTO sqlite_sequence VALUES('g_user_password',2);
INSERT INTO sqlite_sequence VALUES('g_user_scope',3);
INSERT INTO sqlite_sequence VALUES('g_user_scope_user',3);
INSERT INTO sqlite_sequence VALUES('g_user_session',3);
INSERT INTO sqlite_sequence VALUES('g_user_session_scheme',3);
INSERT INTO sqlite_sequence VALUES('g_plugin_module_instance',1);
INSERT INTO sqlite_sequence VALUES('gpo_subject_identifier',2);
INSERT INTO sqlite_sequence VALUES('g_client',1);
INSERT INTO sqlite_sequence VALUES('g_client_property',16);
INSERT INTO sqlite_sequence VALUES('g_client_scope',1);
INSERT INTO sqlite_sequence VALUES('g_client_scope_client',1);
INSERT INTO sqlite_sequence VALUES('g_user_property',2);
INSERT INTO sqlite_sequence VALUES('gpo_code',1);
INSERT INTO sqlite_sequence VALUES('gpo_code_scope',1);
INSERT INTO sqlite_sequence VALUES('gpo_code_scheme',1);
INSERT INTO sqlite_sequence VALUES('gpo_refresh_token',1);
INSERT INTO sqlite_sequence VALUES('gpo_refresh_token_scope',1);
INSERT INTO sqlite_sequence VALUES('gpo_access_token',1);
INSERT INTO sqlite_sequence VALUES('gpo_access_token_scope',1);
INSERT INTO sqlite_sequence VALUES('gpo_id_token',1);
CREATE INDEX i_g_user_session_username ON g_user_session(gus_username);
CREATE INDEX i_g_user_session_last_login ON g_user_session(gus_last_login);
CREATE INDEX i_g_user_session_expiration ON g_user_session(gus_expiration);
CREATE INDEX i_g_user_session_scheme_last_login ON g_user_session_scheme(guss_last_login);
CREATE INDEX i_g_user_session_scheme_expiration ON g_user_session_scheme(guss_expiration);
CREATE INDEX i_g_client_user_scope_username ON g_client_user_scope(gcus_username);
CREATE INDEX i_g_client_user_scope_client_id ON g_client_user_scope(gcus_client_id);
CREATE INDEX i_gak_token_hash ON g_api_key(gak_token_hash);
CREATE INDEX i_g_client_property_name ON g_client_property(gcp_name);
CREATE INDEX i_g_user_property_name ON g_user_property(gup_name);
CREATE INDEX i_gpgc_code_hash ON gpg_code(gpgc_code_hash);
CREATE INDEX i_gpgc_code_challenge ON gpg_code(gpgc_code_challenge);
CREATE INDEX i_gpgr_token_hash ON gpg_refresh_token(gpgr_token_hash);
CREATE INDEX i_gpga_token_hash ON gpg_access_token(gpga_token_hash);
CREATE INDEX i_gpgda_device_code_hash ON gpg_device_authorization(gpgda_device_code_hash);
CREATE INDEX i_gpgda_user_code_hash ON gpg_device_authorization(gpgda_user_code_hash);
CREATE INDEX i_gpoc_code_hash ON gpo_code(gpoc_code_hash);
CREATE INDEX i_gpoc_code_challenge ON gpo_code(gpoc_code_challenge);
CREATE INDEX i_gpor_token_hash ON gpo_refresh_token(gpor_token_hash);
CREATE INDEX i_gpor_jti ON gpo_refresh_token(gpor_jti);
CREATE INDEX i_gpoa_token_hash ON gpo_access_token(gpoa_token_hash);
CREATE INDEX i_gpoa_jti ON gpo_access_token(gpoa_jti);
CREATE INDEX i_gpoi_hash ON gpo_id_token(gpoi_hash);
CREATE INDEX i_gposi_sub ON gpo_subject_identifier(gposi_sub);
CREATE INDEX i_gpocr_management_at_hash ON gpo_client_registration(gpocr_management_at_hash);
CREATE INDEX i_gpoda_device_code_hash ON gpo_device_authorization(gpoda_device_code_hash);
CREATE INDEX i_gpoda_user_code_hash ON gpo_device_authorization(gpoda_user_code_hash);
CREATE INDEX i_gpod_jti_hash ON gpo_dpop(gpod_jti_hash);
CREATE INDEX i_gporar_client_id ON gpo_rar(gporar_client_id);
CREATE INDEX i_gporar_type ON gpo_rar(gporar_type);
CREATE INDEX i_gporar_username ON gpo_rar(gporar_username);
CREATE INDEX i_gpop_request_uri_hash ON gpo_par(gpop_request_uri_hash);
CREATE INDEX i_gpop_code_challenge ON gpo_par(gpop_code_challenge);
CREATE INDEX i_gsc_username ON gs_code(gsc_username);
CREATE INDEX i_gswu_username ON gs_webauthn_user(gswu_username);
CREATE INDEX i_gswc_credential_id ON gs_webauthn_credential(gswc_credential_id);
CREATE INDEX i_gswc_session_hash ON gs_webauthn_credential(gswc_session_hash);
CREATE INDEX i_gswa_session_hash ON gs_webauthn_assertion(gswa_session_hash);
CREATE INDEX i_gsso_username ON gs_otp(gso_username);
CREATE INDEX i_gsuc_username ON gs_user_certificate(gsuc_username);
CREATE INDEX i_gsuc_x509_certificate_id ON gs_user_certificate(gsuc_x509_certificate_id);
CREATE INDEX i_gprs_session_hash ON gpr_session(gprs_session_hash);
CREATE INDEX i_gprs_gprs_token_hash ON gpr_session(gprs_token_hash);
CREATE INDEX i_gprs_gprs_gprs_code_hash ON gpr_session(gprs_code_hash);
CREATE INDEX i_gprue_token_hash ON gpr_update_email(gprue_token_hash);
CREATE INDEX i_gprrcs_session_hash ON gpr_reset_credentials_session(gprrcs_session_hash);
CREATE INDEX i_gprrct_token_hash ON gpr_reset_credentials_email(gprrct_token_hash);
CREATE INDEX i_gsor_username ON gs_oauth2_registration(gsor_username);
COMMIT;
