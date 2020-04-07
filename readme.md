# NexusPHP-Docker
NexusPHP5.6的docker环境\
`Nginx+PHP5.6+Memcache+phpmyadmin+Mysql`
# Usage
```
docker pull dearjoey/nexusphp

# 存放mysql的数据
docker volume create mysql_data

docker run -d \
--name=nexusphp -p 80:80 -p 3306:3306 \
-v mysql_data:/var/lib/mysql \
-v ${nexusphp_code_path}:/NexusPHP \
dearjoey/nexusphp
```
1. `${nexusphp_code_path}` 是NexusPHP代码存放目录
2. `80`是Nginx端口
3. `3306`是DB端口，DB默认账户Root
4. 可以通过`http://localhost/pam/index.php`设置数据库
# Reference
在 https://github.com/fbraz3/lemp-docker 基础上做了一些修改。


