# NexusPHP-Docker
NexusPHP的php5.6版本的docker运行环境\
`Nginx+PHP5.6+Memcached+phpmyadmin+MarialDB+NexusPHP1.5`
# 用法
## 基本使用
``` shell
docker run -d --name=nexusphp -p 80:80  dearjoey/nexusphp
```

`phpmyadmin`: http://localhost/pma/index.php\
`NexusPHP`: http://localhost/inex.php
## 其他参数
| 参数 | 功能 |
| - | - |
| -p 80 | NexusPHP和phpmyadmin的访问端口
| -p 3306 | mysql(mariadb)的访问端口
| -v /config | nginx, php, memcached, marialdb的配置和日志文件夹
| -v /var/lib/mysql | mysql(mariadb)数据保存位置
| -v /NexusPHP | NexusPHP源码保存位置

## 配置
### 数据库初始用户名密码
`username: root`\
`password: nexusphprocks`\
`db: nexusphp`
### 所使用的NexusPHP源码
https://sourceforge.net/projects/nexusphp/








