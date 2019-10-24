FROM php:7.3-fpm-alpine3.9
LABEL maintainer="i@indexyz.me"
# 去除  pdo pdo_mysql
RUN  apk --update --no-cache add nginx git unzip wget curl-dev libcurl && \
  docker-php-ext-install pdo pdo_mysql mbstring bcmath curl && \
  mkdir -p /var/www && \
  wget http://typecho.org/build.tar.gz -O typecho.tgz && \
  tar zxvf typecho.tgz && \
  mv build/* /var/www && \
  rm -f typecho.tgz && \
  chmod -R 777 /var/www 

COPY run.sh /run.sh
COPY config/nginx.conf /etc/nginx/nginx.conf
RUN chmod +x /run.sh
ENTRYPOINT [ "sh", "/run.sh" ]
