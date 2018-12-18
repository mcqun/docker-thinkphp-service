#!/bin/sh
if [ '`ls /app|wc -l`' != '0' ]; then
  echo $GIT_URL
  echo $GIT_BRANCH
  echo $TEMP_DIR
  ls
  if [ $GIT_URL != null ]; then
  echo '----开始下载代码----'
  #git clone $GIT_URL $TEMP_DIR -b $GIT_BRANCH
  #mv -f $TEMP_DIR/* $TEMP_DIR/.[^.]* /app
  #rm -rf $TEMP_DIR
  echo '----代码下载完毕----'
  #composer install
  #php think swoole
  else
    echo '----GIT_URL未设置----'
  fi
else
  echo '----app目录已有内容----'
  composer install
  php think swoole
fi