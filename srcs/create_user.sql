-- Create MySQL user for PhpMyAdmin
CREATE USER 'rofernan'@'localhost' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON *.* TO 'rofernan'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;