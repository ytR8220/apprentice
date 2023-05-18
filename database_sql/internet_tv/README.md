# インターネット TV のテーブルを作成する

<details>
<summary>1. internet_tv ディレクトリを作成して移動</summary>
<div>

```sh
$ mkdir internet_tv && cd $_
```

</div>
</details>

<details>
<summary>2. Dockerfile を作成</summary>
<div>

```sh
$ touch Dockerfile
```

</div>
</details>

<details><summary>3. Dockerfile に以下を記述</summary>

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

- FROM mysql:8.0.33
  mysql:8.0.33 をベースイメージとして使用する
  つまり、mysql のバージョン 8.0.33 を使用するということ

- RUN microdnf install yum
  microdnf を使用して yum をインストールする
  microdnf は、yum の軽量版

- yum install -y glibc-langpack-ja glibc-locale-source git
  glibc-langpack-ja、glibc-locale-source、git をインストールする
  glibc-langpack-ja は、日本語ロケールをインストールするために必要
  glibc-locale-source は、日本語ロケールをインストールするために必要
  git は、git をインストールするために必要

- localedef -f UTF-8 -i ja_JP ja_JP.UTF-8
  ja_JP.UTF-8 のロケールを作成する
  これがないと日本語が文字化けする

- ENV LC_ALL=ja_JP.UTF-8, ENV LANG=ja_JP.UTF-8
  環境変数 LC_ALL に ja_JP.UTF-8 を設定する
  環境変数 LANG に ja_JP.UTF-8 を設定する
  両方ないと日本語が入力できなかったりする

- COPY my.cnf /etc/mysql/conf.d
  my.cnf を/etc/mysql/conf.d にコピーする
  my.cnf は、mysql の設定ファイル
  /etc/mysql/conf.d は、mysql の設定ファイルを配置するディレクトリ

- COPY create-table.sql /docker-entrypoint-initdb.d
  create-table.sql を/docker-entrypoint-initdb.d にコピーする
  create-table.sql は、テーブルを作成するための sql ファイル
  /docker-entrypoint-initdb.d は、コンテナ起動時に実行される sql ファイルを配置するディレクトリ

- ENV MYSQL_ROOT_PASSWORD=root
  環境変数 MYSQL_ROOT_PASSWORD に root を設定する
  root は、mysql の root ユーザのパスワード

- ENV MYSQL_DATABASE=internet_tv
  環境変数 MYSQL_DATABASE に internet_tv を設定する
  internet_tv は、データベース名

</div></details>

<details><summary>4. my.cnf を作成</summary>

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
</details>

<details><summary>5. create-table.sql を作成</summary>

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
</details>

<details><summary>6. マウント用のディレクトリを作成</summary>

<div>

```sh
$ mkdir db
```

</div>
</details>

<details><summary>7. docker イメージをビルド</summary>

<div>
  
```sh
$ docker build -t internet_tv:v1 .
```

</div>
</details>

<details><summary>8. docker コンテナを起動</summary>

<div>
  
```sh
docker run -p 3306:3306 --name internet_tv -d -v "internet_tv/db:/var/lib/mysql" internet_tv:v1
```

</div>
</details>

<details><summary>9. docker コンテナに入る</summary>

<div>
  
```sh
$ docker exec -it internet_tv bin/bash
```

</div>
</details>

<details><summary>10. mysql にログイン</summary>

<div>

```sh
$ mysql -u root -p
```

Enter を押すとパスワード入力を求められるので、Dockerfile で設定したパスワードを入力する

</div>
</details>

<details><summary>11. データベースを選択</summary>

<div>

```sql
mysql> use internet_tv;
```

</div>
</details>

<details><summary>12. テーブルを確認</summary>

<div>

```sql
mysql> show tables;
```

ここで create-table.sql で入力したテーブルが出来ていれば OK

</div>
</details>

<details><summary>13. データを入力</summary>

<div>

```sql
mysql> INSERT INTO <テーブル名> (<カラム名1>, <カラム名2>, ...) VALUES (<値1>, <値2>, ...);
```

INSERT INTO でデータを入力する

</div>

</details>

<details><summary>番外編. データの入力も create-table.sql からできる</summary>

<div>
create-table.sqlでテーブルを作成したあと、INSERT TOを書いておくことで、コンテナ起動時にデータが入力される
</div>

</details>
