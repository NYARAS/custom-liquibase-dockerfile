#!/bin/sh
./cloud_sql_proxy -dir=/cloudsql -instances=${DB_PROJECT}:${DB_REGION}:${DB_INSTANCE}=tcp:3306 -credential_file=/secrets/cloudsql/cloud_sql_credentials.json &
sleep 10

docker-entrypoint.sh --url=${DB_URL} --username=${DB_USERNAME} --password=${DB_PASSWORD} --contexts=production --classpath=/liquibase/changelog --changeLogFile=db-changelog-master.mysql.xml update
