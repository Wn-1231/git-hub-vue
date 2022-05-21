#!/bin/bash
WORK_PATH='/root/wangning/git-hub-action-vue'
cd $WORK_PATH
echo "清理代码"
git reset --hard origin/master
git clean -f
echo "拉取最新代码"
git pull origin master
echo "安装依赖"
npm install
echo "打包最新代码"
npm run build
echo "开始构建镜像"
docker build -t git-hub-action-vue .
echo "删除旧容器"
docker stop git-hub-action-vue-container
docker rm git-hub-action-vue-container
echo "启动新容器"
docker container run -p 80:80 -d --name git-hub-action-vue-container git-hub-action-vue
