# テーブルを定義できる

## 1.データ型

- カラムに入れられる形式のこと。
  - INTEGER：数値型
  - CHAR()：文字列型、カッコ内に数字が入り、それを上限とする。また、上限に達しない場合、上限までスペースを入れて埋めようとする。
  - VARCHAR()：可変長文字列型、カッコ内に数字が入り、それを上限とする。また、上限に達しない場合であってもそのままである。
  - DATE：日付型

## 2.NULL

- 何もデータがない、つまり空白を意味する。

## 3.プライマリーキー

- 行を特定できるキー。これだけでその行を特定できるというもの。プライマリーキーは同じテーブル内で重複しない。

## 4.初期値

- テーブル定義時に指定しておくことで、レコード追加時に指定がなければ予めしていた値が入るようになる。

## 5.AUTO INCREMENT

- 自動でナンバリングしてくれる。レコードが連番の場合、手動で入れる必要がないのでミスが減る上に楽である。

## 6.外部キー制約

- 親テーブルにある値（カラム値）しか子テーブルのカラムで使うことが出来ないように限定することができる。これによってデータの整合性が保たれる。

# 7.ユニークキー制約

- 一つのテーブルの同じカラムに重複した値を格納することを制限できる。

# 8.テーブル定義

- CREATE TABLE Users (
  ユーザー ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  姓 VARCHAR(10) NOT NULL,
  名 VARCHAR(10) NOT NULL,
  年齢 INT,
  性別 ENUM('男性', '女性', '回答なし') NOT NULL,
  電話番号 VARCHAR(20) NOT NULL,
  メールアドレス VARCHAR(50) NOT NULL,
  UNIQUE (電話番号),
  UNIQUE (メールアドレス)
  );

- CREATE TABLE Address (
  ユーザー ID INT NOT NULL PRIMARY KEY,
  住所 1, VARCHAR(30) NOT NULL,
  住所 2, VARCHAR(30),
  住所 3, VARCHAR(30),
  FOREIGN KEY (ユーザー ID) REFERENCES Users(ユーザー ID)
  );

- CREATE TABLE Buy_history (
  ユーザー ID INT NOU NULL,
  購入日時 DATE NOT NULL,
  商品 ID INT NOT NULL,
  購入量 INT NOT NULL,
  PRIMARY KEY (ユーザー ID, 購入日時)
  FOREIGN KEY (ユーザー ID) REFERENCES Users(ユーザー ID)
  FOREIGN KEY (商品 ID) REFERENCES Product(商品 ID)
  );

- CREATE TABLE Product (
  商品 ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  商品名 VARCHAR(100) NOT NULL,
  価格 INT NOT NULL,
  在庫 INT NOT NULL,
  カテゴリー ID INT NOT NULL,
  UNIQUE (商品名),
  FOREIGN KEY (カテゴリー ID) REFERENCES Category(カテゴリー ID)
  );

- CREATE TABLE Category (
  カテゴリー ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  カテゴリー名 VARCHAR(30) NOT NULL,
  UNIQUE (カテゴリー名)
  )
