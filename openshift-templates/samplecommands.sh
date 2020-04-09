 oc login https://console.nexgen.parkar.consulting

 oc login https://console.nexgen.parkar.consulting:443 --token=QQnj_4nBqn08ytoSzgE8bV5FarXow7jtcl0WpDVJKFM

 oc create -f leantime-template.yml -n leantimedev

 oc logs --version 1 bc/leantime-mysql-persistent -n leantimedev > buildlog.log

 oc new-app https://github.com/sclorg/cakephp-ex

  

 mysql -h 127.0.0.1 -u leantime -D ${DATABASE_NAME} -e 'SELECT 1'

 Yh8cbyqokoPDjjat

 MYSQL_PWD='Yh8cbyqokoPDjjat' mysql -h 127.0.0.1 -u  leantime -D leantime -e 'SELECT 1'

 oc start-build --from-build=leantime -n bc/leantime --follow
 oc start-build leantime --from-dir=. --follow
 oc adm prune images --keep-tag-revisions=3 --keep-younger-than=60m 

 curl  http://127.0.0.1:8080/fpm-ping

  php -r 'print getenv("DATABASE_NAME") . "\n";'
  php -r 'print getenv("DATABASE_NAME") . "\n";'
  php -r 'print $_ENV["DATABASE_NAME"];'
  php -r 'print $_SERVER["DATABASE_NAME"];'

  sed -i 's/$dbHost="localhost"/$dbHost="'"${DB_HOST}"'"/g' configuration.sample.php
  sed -i 's/$dbHost="localhost"/$dbHost="'"${DB_HOST}"'"/g' config/configuration.php && \
    sed -i 's/$dbUser=""/$dbUser="'"${MYSQL_USER}"'"/g' config/configuration.php && \
    sed -i 's/$dbPassword=""/$dbPassword="'"${MYSQL_PASSWORD}"'"/g' config/configuration.php && \
    sed -i 's/$dbDatabase=""/$dbDatabase="'"${DATABASE_NAME}"'"/g' configuration.sample.php

    sed -i 's/variables_order/;&/' /etc/php7/php.ini