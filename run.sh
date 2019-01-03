#!/bin/sh
if [ '`ls /app|wc -l`' != '0' ]; then
  ls -l /app
  if [ $GIT_URL != null ]; then
    echo '----开始下载代码----'
    git clone $GIT_URL /app/$APP_NAME -b $GIT_BRANCH
    echo '----代码下载完毕----'
    if [ '`ls /app|wc -l`' != '0' ]; then
      cd /app/$APP_NAME
      composer install
      php think swoole
    else
      echo '----文件转移失败----'
    fi
  else
    echo '----GIT_URL未设置----'
  fi
else
  echo '----app目录已有内容----'
  cd /app/$APP_NAME
  composer install
  php think swoole
fi