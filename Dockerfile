FROM mcqun/docker-composer-swoole

ENV GIT_URL=null \
  GIT_BRANCH=master \
  TEMP_DIR=/home/www-data/tmp

RUN set -ex \
  && apk update \
  && apk add --no-cache git\
  && mkdir /app \
  && chown -R www-data:www-data /app

USER www-data

COPY --chown=www-data:www-data ./run.sh /

RUN chmod -R 755 /run.sh

WORKDIR /app
VOLUME /app

ENTRYPOINT /run.sh