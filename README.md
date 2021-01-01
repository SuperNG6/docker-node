# docker-node
https://hub.docker.com/r/superng6/node

基于nodejs官方镜像构建，添加 cnpm git curl wget tzdata 等常用工具

## 快速搭建hexo测试环境
使用轻量级http服务器darkhttpd，挂载hexo`./public`文件夹，实时查看修改效果  
推荐使用VSC远程开发，操作node容器  


````
mkdir -p /root/app/hexo/public
cd /root/app
````
````
docker-compose exec node bash  
````
````
cnpm install hexo-cli -g
hexo init hexo
cd hexo
cnpm install
hexo g

````


````
version: "3"

services:

  node:
    image: superng6/node:latest
    container_name: node
    tty: true
    volumes:
      - /root/app:/app

  web:
    image: superng6/darkhttpd:latest
    container_name: web
    command: /www/public
    ports:
      - 80:80
    volumes:
      - /root/app/hexo:/www
    depends_on:
      - node
````
