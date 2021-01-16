DELETE FROM mysql.user WHERE user='root' AND host='localhost';
CREATE USER IF NOT EXISTS 'root'@'%' IDENTIFIED BY 'nexusphprocks';
GRANT ALL PRIVILEGES ON *.* to 'root'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;