# NexusPHP-docker
NexusPHP5.6的docker环境
# Usage
```
docker run -d \
--name=nexusphp -p 80:80 -p 3306:3306 \
-v ${db_data_path}:/var/lib/mysql \
-v ${nexusphp_code_path}:/NexusPHP \
dearjoey/nexusphp
```