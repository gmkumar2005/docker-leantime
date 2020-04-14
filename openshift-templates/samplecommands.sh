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

  oc create -f buildconfig.yml -n leantimedev
  

  oc import-image phpbase:7.3-fpm-alpine --from=php:7.3-fpm-alpine --confirm -n leantimedev 
  oc new-build --name=leantime-basebuild --strategy docker --image-stream=phpbase:7.3-fpm-alpine --binary=true -n leantimedev
  oc start-build leantime-basebuild --from-dir=. --follow -n leantimedev

  # empty app
  oc new-app php-nginx-basebuild:latest --allow-missing-images --name=php-base-app  -n leantimedev
  oc set triggers dc -l app=php-base-app --containers=php-base-app --from-image=php-nginx-basebuild:latest --manual -n leantimedev
  oc rollout cancel dc/php-base-app -n leantimedev
  oc expose svc/php-base-app -n leantimedev
  php-nginx-basebuild:latest

  # Leantime app
  oc new-build --name=leantime-build --strategy docker --image-stream=leantime-basebuild --binary=true -n leantimedev
  oc start-build leantime-build --from-dir=. --follow -n leantimedev
  oc new-app leantime-basebuild:latest --allow-missing-images --name=leantime-app  -n leantimedev
  oc set triggers dc -l leantime-app --containers=leantime-app --from-image=leantime-build:latest --manual -n leantimedev
  oc rollout cancel dc/leantime-app -n leantimedev
  oc expose svc/leantime-app -n leantimedev



oc create -f leantime-template-stagejob.yml -n leantimestage
oc delete template leantime -n leantimestage
oc delete project leantimestage

oc  policy add-role-to-group edit system:serviceaccount:leantimestage -n leantimestage
oc delete job leantime-installer -n leantimestage
oc new-app  -f leantime-template-stagejob.yaml -n leantimestage
oc delete all -l leantimelabel -n leantimestage


oc new-build phpbase:7.3-fpm-alpine~https://github.com/gmkumar2005/docker-leantime.git --context-dir=baseimage --name=leantime-basebuild  --strategy=docker -n leantimestage
oc start-build leantime-basebuild   -n leantimestage        

oc create secret generic leantimesecret  --from-literal="database_password=sqladmin" --from-literal="database_user=sqladmin" --from-literal="leantime_secret_token=sqladmin" --from-literal="lleantime_security_salt=sqladmin" -n leantimestage
oc set env dc/leantime-app  --from=secret/leantimesecret    -n leantimestage

 oc new-build leantime-basebuild~https://github.com/gmkumar2005/docker-leantime.git --context-dir=leantimeimage --name=leantime-build  --strategy=docker  -n leantimestage

 oc new-project leantimestage --description="Leantime testing" --display-name="Leantime-stage"

 oc new-build --name=leantime-phpbasebuild https://github.com/gmkumar2005/docker-leantime.git --context-dir=baseimage --strategy=docker --image-stream=phpbase:7.3-fpm-alpine -n leantimestage

 oc new-project leantimestage --description="Leantime testing" --display-name="Leantime-stage"
 oc policy add-role-to-user edit system:serviceaccount:leantimestage:default -n leantimestage



 oc import-image phpbase:7.3-fpm-alpine --from=php:7.3-fpm-alpine --confirm -n leantimestage
 oc new-build --name=leantime-basebuild leantimestage/phpbase:7.3-fpm-alpine~https://github.com/gmkumar2005/docker-leantime.git   --context-dir=baseimage --strategy=docker --allow-missing-images -n leantimestage
 oc start-build leantime-basebuild -n leantimestage

 # Delete
oc delete images  --all -n leantimestage
oc delete is  --all -n leantimestage
oc delete dc  --all -n leantimestage
oc delete bc  --all -n leantimestage
oc delete builds  --all -n leantimestage
oc delete job leantime-installer -n leantimestage


# mysql
oc new-app --name=testdb2 -e MYSQL_USER=leantime   -e MYSQL_PASSWORD=leantime -e MYSQL_DATABASE=leantime   docker.io/centos/mysql-57-centos7:latest -n leantimestage
oc rsh <pod>

oc new-app --name=leantimemysql -e MYSQL_USER=leantime -e MYSQL_PASSWORD=QsPn7giASecxG0mD -e MYSQL_DATABASE=leantime docker.io/centos/mysql-57-centos7:latest -n leantimestage
oc rsh leantimemysql-1-szmmp
mysql -u leantime -pQsPn7giASecxG0mD   leantime