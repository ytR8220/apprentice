# 検索結果の並び替えができる

## 1.昇順の並び替え

- SELECT \* FROM <テーブル名> ORDER BY <カラム名> ASC [LIMIT <行数指定>];

## 2.降順の並び替え

- SELECT \* FROM <テーブル名> ORDER BY <カラム名> DESC [LIMIT <行数指定>];

## 3.複数条件の並び替え

- SELECT \* FROM <テーブル名> ORDER BY <カラム名> [<ソート順>], <カラム名> [<ソート順>] [LIMIT <行数指定>];
