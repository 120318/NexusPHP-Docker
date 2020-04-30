# NexusPHP-Docker
NexusPHP的php5.6版本的docker运行环境\
`Nginx+PHP5.6+Memcache+phpmyadmin+MarialDB`
# Usage
``` shell
docker pull dearjoey/nexusphp

# 存放mysql的数据
docker volume create mysql_data

docker run -d --name=nexusphp -p 80:80 -p 3306:3306 -v mysql_data:/var/lib/mysql -v ${nexusphp_code_path}:/NexusPHP dearjoey/nexusphp
```
**注意：你需要将上面命令中的`${nexusphp_code_path}` 替换为你自己的NexusPHP源码路径，比如：`D://NexusPHP`**
1. `/NexusPHP`是NexusPHP代码存放目录
2. `80`是Nginx端口
3. `3306`是DB端口，DB默认用户名Root, 默认密码为空
4. 可以通过`phpmyadmin`管理数据库:`http://localhost/pma/index.php`
5. `nginx`日志在`/var/log/nginx`目录下，`php-fpm`和`php`错误日志都在`/var/log/php`目录下



# Reference
在 https://github.com/fbraz3/lemp-docker 基础上做了一些修改。


