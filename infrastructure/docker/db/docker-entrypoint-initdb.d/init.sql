-- ローカル開発用データベース
CREATE DATABASE IF NOT EXISTS local_db;
CREATE USER 'local_user'@'%' IDENTIFIED BY 'hogeh0gePass&';
ALTER USER 'local_user'@'%' IDENTIFIED WITH mysql_native_password BY 'hogeh0gePass&';
GRANT ALL PRIVILEGES ON local_db.* TO 'local_user'@'%';

-- テスト用データベース
CREATE DATABASE local_db_test;
CREATE USER 'local_user_test'@'%' IDENTIFIED BY 'hogeh0gePass&';
ALTER USER 'local_user_test'@'%' IDENTIFIED WITH mysql_native_password BY 'hogeh0gePass&';
GRANT ALL PRIVILEGES ON local_db_test.* TO 'local_user_test'@'%';

FLUSH PRIVILEGES ;