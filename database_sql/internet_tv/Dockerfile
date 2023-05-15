FROM mysql:8.0.33
RUN microdnf install yum && \
yum install -y glibc-langpack-ja glibc-locale-source git && \
localedef -f UTF-8 -i ja_JP ja_JP.UTF-8
ENV LC_ALL=ja_JP.UTF-8
ENV LANG=ja_JP.UTF-8
COPY my.cnf /etc/mysql/conf.d
COPY create-table.sql /docker-entrypoint-initdb.d
ENV MYSQL_ROOT_PASSWORD=root
ENV MYSQL_DATABASE=internet_tv