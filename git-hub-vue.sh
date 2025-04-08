#!/bin/bash
WORK_PATH='/root/git-hub-vue'
cd $WORK_PATH
echo "清理代码"
git reset --hard origin/master
git clean -f
echo "拉取最新代码"
git pull origin master
echo "安装依赖"
npm install
echo "删除旧 dist"
rm -rf dist
echo "打包最新代码"
npm run build
echo "开始构建镜像"
docker build -t git-hub-vue .
echo "删除旧容器"
docker stop git-hub-vue-container
docker rm git-hub-vue-container
echo "启动新容器"
docker container run -p 80:80 -d --name git-hub-vue-container git-hub-vue
