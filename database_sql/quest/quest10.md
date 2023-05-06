# データをグルーピングできる

## 1.グルーピング

- SELECT <集計(<カラムの指定>)> FROM <テーブル名> GROUP BY <グループ化カラム> [LIMIT <行数指定>];

## 2.グルーピングと集計関数

- 従業員番号 10001 から 10010 の従業員ごとの最小給与と最大給与を取得する場合
  SELECT emp_no, MIN(salary), MAX(salary) FROM salaries WHERE emp_no BETWEEN 10001 AND 10010 GROUP BY emp_no;

## 3.グルーピングと集計関数 2

- 従業員番号 10001 から 10010 の従業員ごとの勤務開始日と勤務終了日を取得する場合
  SELECT emp_no, min(from_date), max(to_date) FROM salaries WHERE emp_no BETWEEN 10001 AND 10010 GROUP BY emp_no;

## 4.絞り込み

- 従業員ごとの最大給与を求め、そのうち最大給与が 140,000 を超えている従業員の従業員番号と最大給与を取得する場合
  SELECT emp_no, MAX(salary) FROM salaries GROUP BY emp_no HAVING MAX(salary) > 140000;

## 5.最小給与

- 従業員番号 10001 から 10100 の従業員のうち、最小給与が 40,000 を下回っている従業員の従業員番号とその最小給与を取得する場合
  SELECT emp_no, MIN(salary) FROM salaries WHERE emp_no BETWEEN 10001 AND 10100 GROUP BY emp_no HAVING MIN(salary) < 40000;

## 6.最終勤務日

- 従業員番号 10001 から 10100 の従業員のうち、勤務が終了している従業員の従業員番号と最後の勤務終了日を取得する場合
  SELECT emp_no, MAX(to_date) FROM salaries WHERE emp_no BETWEEN 10001 AND 10100 GROUP BY emp_no HAVING MAX(to_date) <> '9999-01-01';
  SELECT emp_no, MAX(to_date) FROM salaries WHERE emp_no BETWEEN 10001 AND 10100 GROUP BY emp_no HAVING NOT MAX(to_date) = '9999-01-01';
