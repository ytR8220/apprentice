# データを絞り込むことができる

## 1.指定した行数のみ取得

- SELECT \* FROM <テーブル名> LIMIT <行数指定>
- SELECT \* FROM <テーブル名> LIMIT <開始位置>, <行数指定> で、任意の位置から取得可能

## 2.等しいデーターの絞り込み

- SELECT \* FROM <テーブル名> WHERE <カラム名> = <比較対象> [LIMIT <行数指定>];

## 3.等しくないデータの絞り込み

- SELECT \* FROM <テーブル名> WHERE NOT <カラム名> = <比較除外対象> [LIMIT <行数指定>]; ※否定形
- SELECT \* FROM <テーブル名> WHERE <カラム名> <> <比較除外対象> [LIMIT <行数指定>]; ※オーソドックス

## 4.より大きいデータの絞り込み

- SELECT \* FROM <テーブル名> WHERE <カラム名> > <比較対象> [LIMIT <行数指定>];

## 5.あいまいな条件の絞り込み

- SELECT \* FROM <テーブル名> WHERE <カラム名> LIKE <検索方法> [LIMIT <行数指定>];
  - 検索方法
    部分一致 -> '%<検索文字>%'
    前方一致 -> '<検索文字>%'
    後方一致 -> '%<検索文字>'
    部分一致 -> '<検索文字>'
  - 否定形も使用可能
    NOT LIKE

## 6.特定の範囲の絞り込み

- SELECT \* FROM <テーブル名> WHERE <カラム名> > <比較対象最大値> AND <カラム名> < <比較対象最小値> [LIMIT <行数指定>];
  ※比較対象最大値から比較対象最小値までの間を抽出
- SELECT \* FROM <テーブル名> WHERE <カラム名> BETWEEN <比較対象最大値> AND <比較対象最小値> [LIMIT <行数指定>];

## 7.かつ

- SELECT \* FROM <テーブル名> WHERE <カラム名> = <比較対象> AND <カラム名> = <比較対象> [LIMIT <行数指定>];

## 8.または

- SELECT \* FROM <テーブル名> WHERE <カラム名> = <比較対象> OR <カラム名> = <比較対象> [LIMIT <行数指定>];

## 9.含まれる

- SELECT \* FROM <テーブル名> WHERE <カラム名> IN (<含まれる条件,...,...>)

## 10.従業員番号

- SELECT <表示したいカラム名 1>, <表示したいカラム名>, ... FROM <テーブル名> WHERE <条件カラム名> = <比較対象>;

## 11.誕生日

- SELECT \* FROM <テーブル名> WHERE <カラム名> LIKE <検索条件> [LIMIT <行数指定>];