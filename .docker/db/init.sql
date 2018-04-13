CREATE USER heroes_oracle_app WITH ENCRYPTED PASSWORD 'password';
-- CREATE DATABASE heroes_oracle;
-- ALTER DATABASE heroes_oracle OWNER TO heroes_oracle_app;
ALTER USER heroes_oracle_app CREATEDB;
