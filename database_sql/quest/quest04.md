# テーブルを作成・修正・削除できる

## 1.テーブルの作成

- CREATE TABLE Product
  (id char(4) not null);

## 2.テーブルの表示

- SHOW TABLES;

## 3.カラムの追加

- ALTER TABLE Product ADD COLUMN name varchar(30);

## 4.カラムの表示

- SHOW COLUMNS FROM Product;

## 5.カラムの削除

- ALTER TABLE Product DROP COLUMN name;

## 6.テーブルの削除

- DROP TABLE Product;
