#!/bin/sh
if [ '`ls /app|wc -l`' != '0' ]; then
  ls
  if [ $GIT_URL != null ]; then
    echo '----开始下载代码----'
    git clone $GIT_URL /app -b $GIT_BRANCH
    echo '----代码下载完毕----'
    if [ '`ls /app|wc -l`' != '0' ]; then
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
  composer install
  php think swoole
fi