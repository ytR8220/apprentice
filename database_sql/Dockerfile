FROM mysql:8.0.33
RUN microdnf install yum && \
yum install -y glibc-langpack-ja glibc-locale-source git
COPY my.cnf /etc/mysql/conf.d
# COPY create-table.sql /docker-entrypoint-initdb.d  # create-tabale.sqlはCREATE TABLE文が書かれたファイル
ENV MYSQL_ROOT_PASSWORD=root
ENV MYSQL_DATABASE=quest
