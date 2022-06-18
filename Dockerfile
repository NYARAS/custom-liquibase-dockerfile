#### Using this specific version of liquibase since the newer versions
# are not working due to licensing issue

FROM liquibase/liquibase:4.2.2 

RUN wget https://dl.google.com/cloudsql/cloud_sql_proxy.linux.amd64 -O cloud_sql_proxy

RUN chmod +x cloud_sql_proxy
USER root
RUN mkdir /cloudsql
RUN chmod 777 /cloudsql

# Path to the changelog source
ADD /src/main/resources/db/changelog /liquibase/changelog

ADD liquibase.sh /liquibase/liquibase.sh

CMD ["sh", "-c", "./liquibase.sh"]
