#!/bin/sh                                                                                                                                                                                       
set -e                                                                                                                                                                                          
cp -a /usr/src/typecho/typecho-master/* /var/www/html/                                                                                                                                          
exec "$@" 
