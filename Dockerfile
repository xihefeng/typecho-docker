FROM php:fpm-alpine
LABEL maintainer="i@indexyz.me"                                                                                                                                                                     
# 去除  pdo pdo_mysql                                                                                                                                                                               
WORKDIR /var/www/html
RUN  apk --update --no-cache add wget  unzip && \
  docker-php-ext-install pdo pdo_mysql bcmath  && \
  mkdir -p /usr/src/typecho &&\
  wget  https://github.com/typecho/typecho/archive/master.zip -O master.zip && \
   unzip -d /usr/src/typecho/ master.zip && \
  rm -rf /tmp/* && cp -r /usr/src/typecho/typecho-master/* /var/www/html && rm -rf /usr/src/typecho                                                                                                                              
 
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
VOLUME /var/www/html
EXPOSE 80
CMD ["/entrypoint.sh" ]
CMD [ "php", "-S", "0.0.0.0:80", "-t", "/var/www/html" ]
