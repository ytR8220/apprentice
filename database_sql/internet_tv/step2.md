# インターネット TV のテーブルを作成する

<detail>
<summary>1. internet_tv ディレクトリを作成して移動</summary>
<div>

```sh
$ mkdir internet_tv && cd $_
```

</div>
</detail>

<detail>
<summary>2. Dockerfile を作成</summary>
<div>

```sh
$ touch Dockerfile
```

</div>
</detail>

<detail><summary>3. Dockerfile に以下を記述</summary>

<div>

```
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
```

</div></detail>

<detail><summary>4. my.cnf を作成</summary>

<div>

```
[client]

[mysqld]
character-set-server=utf8
skip-character-set-client-handshake
default-storage-engine=INNODB

[mysqldump]
default-character-set = utf8

[mysql]
```

</div>
</detail>

<detail><summary>5. create-table.sql を作成</summary>

<div>

```sql
CREATE TABLE Channel (
  Channel_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  Channel_Name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE Genre (
  Genre_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  Genre_Name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE Program (
  Program_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  Genre_ID INT NOT NULL,
  Program_Name VARCHAR(50) NOT NULL,
  Program_Description VARCHAR(255) NOT NULL,
  FOREIGN KEY (Genre_ID) REFERENCES Genre(Genre_ID),
  INDEX(Program_Name)
);

CREATE TABLE Season (
  Season_ID INT NOT NULL PRIMARY KEY,
  Season_Name VARCHAR(50) NOT NULL
);

CREATE TABLE Episode (
  Episode_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  Program_ID INT NOT NULL,
  Season_ID INT NOT NULL DEFAULT 0,
  Episode_number INT NOT NULL,
  Episode_Name VARCHAR(50) NOT NULL,
  Episode_Description VARCHAR(255) NOT NULL,
  Release_Date DATE NOT NULL,
  FOREIGN KEY (Program_ID) REFERENCES Program(Program_ID),
  FOREIGN KEY (Season_ID) REFERENCES Season(Season_ID),
  INDEX(Episode_Name)
);

CREATE TABLE Program_table (
  Episode_ID INT NOT NULL,
  Start_Time DATETIME NOT NULL,
  End_Time DATETIME NOT NULL,
  Channel_ID INT NOT NULL,
  Views_Count INT NOT NULL DEFAULT 0,
  PRIMARY KEY (Episode_ID, Channel_ID, Start_Time),
  FOREIGN KEY (Episode_ID) REFERENCES Episode(Episode_ID),
  FOREIGN KEY (Channel_ID) REFERENCES Channel(Channel_ID)
);
```

</div>
</detail>

<detail><summary>6. マウント用のディレクトリを作成</summary>

<div>

```sh
$ mkdir db
```

</div>
</detail>

<detail><summary>7. docker イメージをビルド</summary>

<div>
  
```sh
$ docker build -t internet_tv:v1 .
```

</div>
</detail>

<detail><summary>8. docker コンテナを起動</summary>

<div>
  
```sh
docker run -p 3306:3306 --name internet_tv -d -v "internet_tv/db:/var/lib/mysql" internet_tv:v1
```

</div>
</detail>

<detail><summary>9. docker コンテナに入る</summary>

<div>
  
```sh
$ docker exec -it internet_tv bin/bash
```

</div>
</detail>

<detail><summary>10. mysql にログイン</summary>

<div>

```sh
$ mysql -u root -p
```

Enter を押すとパスワード入力を求められるので、Dockerfile で設定したパスワードを入力する

</div>
</detail>

<detail><summary>11. データベースを選択</summary>

<div>

```sql
mysql> use internet_tv;
```

</div>
</detail>

<detail><summary>12. テーブルを確認</summary>

<div>

```sql
mysql> show tables;
```

ここで create-table.sql で入力したテーブルが出来ていれば OK

</div>
</detail>

<detail><summary>13. データを入力</summary>

<div>

```sql
mysql> INSERT INTO <テーブル名> (<カラム名1>, <カラム名2>, ...) VALUES (<値1>, <値2>, ...);
```

INSERT INTO でデータを入力する

</div>

</detail>

<detail><summary>番外編. データの入力も create-table.sql からできる</summary>

<div>
create-table.sqlでテーブルを作成したあと、INSERT TOを書いておくことで、コンテナ起動時にデータが入力される
</div>

</detail>
