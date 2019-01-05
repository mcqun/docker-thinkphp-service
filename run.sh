#!/bin/sh
if [ '`ls -A /app|wc -w`' = '0' ]; then
  ls -ld /app
  ls -A /app
  if [ $GIT_URL != null ]; then
    echo '-----清空APP文件夹----'
    rm -rf /app/* /app/.[^.]*
    echo '----开始下载代码----'
    git clone $GIT_URL $TEMP_DIR -b $GIT_BRANCH
    echo '----GIT分支名：'$GIT_BRANCH'-----'
    mv -f $TEMP_DIR/* $TEMP_DIR/.[^.]* /app
    rm -rf $TEMP_DIR
    echo '----代码下载完毕----'
    if [ '`ls -A /app|wc -w`' != '0' ]; then
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