# データを集計できる

## 1.列の合計値

- SELECT SUM(<カラムの指定>) FROM <テーブル名>;
- SUM(<カラムの指定>) AS <別名> とすることで、カラムに別名をつけて表示させられる

## 2.列の平均値

- SELECT AVG(<カラムの指定>) FROM <テーブル名>;
- AVG(<カラムの指定>) AS <別名> とすることで、カラムに別名をつけて表示させられる

## 3.四捨五入

- SELECT ROUND(AVG(<カラムの指定>)) FROM <テーブル名>;
- ROUND(AVG(<カラムの指定>)) AS <別名> とすることで、カラムに別名をつけて表示させられる

## 4.列の最大値

- SELECT MAX(<カラムの指定>) FROM <テーブル名>;
- MAX(<カラムの指定>) AS <別名> とすることで、カラムに別名をつけて表示させられる

## 5.列の最小値

- SELECT MIN(<カラムの指定>) FROM <テーブル名>;
- MIN(<カラムの指定>) AS <別名> とすることで、カラムに別名をつけて表示させられる

## 6.行数

- SELECT COUNT(<カラムの指定>) FROM <テーブル名>;
- COUNT(<カラムの指定>) AS <別名> とすることで、カラムに別名をつけて表示させられる
- COUNT の場合、カラムを指定すると NULL は含まない。NULL も含める場合は下記
- SELECT COUNT(\*) FROM <テーブル名>;

## 7.絞り込みとの組み合わせ

- SELECT MAX(<カラムの指定>) FROM <テーブル名> WHERE <絞り込みカラム名> = <絞り込み条件>;

## 8.少数第 1 桁

- SELECT ROUND(AVG(<カラムの指定>), 1) FROM <テーブル名> WHERE <絞り込みカラム名> = <絞り込み条件>;