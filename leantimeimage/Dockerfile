FROM  leantime-basebuild:latest
LABEL Maintainer="Kiran Kumar Mallru" \
      Description="Lightweight container with Nginx 1.16 & PHP-FPM 7.3 based on Alpine Linux. based on https://github.com/TrafeX/docker-php-nginx. Credits Tim de Pater"


# Configure nginx
COPY nginx.conf /etc/nginx/nginx.conf
# Remove default server definition
# RUN rm /etc/nginx/conf.d/default.conf

# Configure PHP-FPM
COPY fpm-pool.conf /etc/php7/php-fpm.d/www.conf
# COPY config/fpm-pool.conf /usr/local/etc/php-fpm.d/www.conf
COPY php.ini /etc/php7/conf.d/custom.ini
# use default value variables_order = "GPCS" 
# RUN sed -i 's/variables_order/;&/' /etc/php7/php.ini
# Configure supervisord
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# RUN git clone https://github.com/gmkumar2005/leantime.git  leantime --depth 1
# Setup document root
RUN mkdir -p /var/www/html
# RUN curl -LJ https://github.com/Leantime/leantime/releases/download/v2.0.15/Leantime-V2.0.15.tar.gz  -o  Leantimerelease.tar.gz && \
  #  tar -zxf Leantimerelease.tar.gz --strip-components 1

    
RUN curl -LJsS ${LEANTIME_RELEASE_URL}  -o  Leantimerelease.tar.gz && \
    tar -zxf Leantimerelease.tar.gz --strip-components 1

#RUN mkdir -p /var/www/html/public
RUN rm Leantimerelease.tar.gz
RUN rm config/configuration.php

# Make sure files/folders needed by the processes are accessable when they run under the nobody user
RUN chown -R nobody.nobody /var/www/html 
# Make the document root a volume
# VOLUME /var/www/html

COPY configuration.php config/configuration.php
# Switch to use a non-root user from here on
USER nobody

# Add application
WORKDIR /var/www/html
# COPY src/ /var/www/html/
# RUN  chown -R nobody.nobody  /

# Expose the port nginx is reachable on
EXPOSE 8080

# Let supervisord start nginx & php-fpm
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]

# Configure a healthcheck to validate that everything is up&running
HEALTHCHECK --timeout=10s CMD curl --silent --fail http://127.0.0.1:8080/fpm-ping
