FROM mcqun/docker-composer-swoole

ENV GIT_URL=null \
  GIT_BRANCH=master \
  SWOOLE_PORT=9501\
  TEMP_DIR=/home/www-data/tmp

RUN set -ex \
  && apk update \
  && apk add --no-cache git\
  && mkdir /app \
  && chown -R www-data:www-data /app \
  && ls -ld /app

COPY ./run.sh /

RUN chmod +x /run.sh

WORKDIR /app

USER www-data

ENTRYPOINT /run.sh