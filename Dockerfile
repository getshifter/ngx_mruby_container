FROM amazonlinux:2
LABEL maintenaner=sawanoboriyu@higanworks.com
RUN curl -s https://packagecloud.io/install/repositories/amimoto-nginx-mainline/amzn2/script.rpm.sh | bash

COPY amimoto-nginx-mainline_amzn2.repo /etc/yum.repos.d/amimoto-nginx-mainline_amzn2.repo
RUN yum clean all && \
   yum install -y nginx \
  nginx-mod-ngx_pagespeed \
  nginx-mod-ngx_mruby \
  nginx-mod-http_cache_purge23 \
  && rm -rf /var/cache/yum
ENTRYPOINT [ "/bin/bash" ]
