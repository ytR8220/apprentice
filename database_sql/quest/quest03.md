# ユーザーを作成・権限付与・削除できる

## 1.ユーザーの作成

- CREATE USER '<ユーザー名>'@'localhost' IDENTIFIED BY '<パスワード>';

## 2.ユーザーの表示

- SELECT USER,HOST FROM mysql.user;

## 3.ユーザーへの権限付与

- GRANT ALL PRIVILEGES ON \*.\* TO '<ユーザー名>'@'localhost';
  GRANT <権限> ON <対象データベース>.<対象テーブル> '<ユーザー名>'@'localhost' [WITH GRANT OPTION];
  <権限>には付与したい権限が入る。すべてであれば ALL となる
  <対象データベース>では権限が適用されるデータベースを指定できる。すべてであれば \* となる
  <対象テーブル>の対象データベースと同様である
  option がつけられる。例えば「WITH GRANT OPTION」をつけると、権限を与えられたユーザーが他のユーザーに対しても権限を与えられるようになる。（ただし自身の権限範囲内）
- 権限を限定的にする
  - CREATE -> 新しいテーブルやデータベースを作成できる
  - DROP -> テーブルやデータベースを削除できる
  - DELETE -> テーブルから行（レコード）を削除できる
  - INSERT -> テーブルに行（レコード）を挿入できる
  - SELECT -> SELECT コマンドを使用できる
  - UPDATE -> テーブルの行（レコード）を更新できる
  - GRANT OPTION -> 他のユーザーへの権限付与や削除ができる

## 4.権限のリロード

- FLUSH PRIVILEGES;

## 5.ユーザーの削除

- DROP USER '<ユーザー名>'@'localhost';
