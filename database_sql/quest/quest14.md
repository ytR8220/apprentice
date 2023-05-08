# 条件分岐ができる

## 1.CASE

- 従業員番号 10100 から 10200 の従業員に対して、最終在籍日に応じて在籍中か離職済みかを出し分けたい場合
  SELECT emp_no, to_date, CASE WHEN to_date = '9999-01-01' THEN 'employed' ELSE 'unemployed' END AS employed FROM salaries WHERE emp_no BETWEEN 10100 AND 10200;

## 2.年代

- 従業員番号が 10001 から 10050 の従業員を対象に、従業員番号、誕生日、年代を表示してください。なお年代は、誕生日が 1950 年代の場合「50s」、誕生日が 1960 年代の場合「60s」と表記したい場合
  1. SELECT emp_no, birth_date, CASE WHEN SUBSTRING_INDEX(birth_date, '-', 1) - 1960 >= 0 THEN '60s' WHEN SUBSTRING_INDEX(birth_date, '-', 1) - 1950 >= 0 THEN '50s' END as generation FROM employees WHERE emp_no BETWEEN 10001 AND 10050;
  2. SELECT emp_no, birth_date, CASE WHEN YEAR(birth_date) >= 1960 AND YEAR(birth_date) < 1970 THEN '60s' WHEN YEAR(birth_date) >= 1950 AND YEAR(birth_date) < 1960 THEN '50s' END as generation FROM employees WHERE emp_no BETWEEN 10001 AND 10050;

## 3.年代ごとの最大給与

- 年代ごとの最大給与を取得してください。なお年代は、誕生日が 1950 年代の場合「50s」、誕生日が 1960 年代の場合「60s」と表記する場合
  1. SELECT MAX(salary) AS max_salary, CASE WHEN YEAR(birth_date) >= 1960 AND YEAR(birth_date) < 1970 THEN '60s' WHEN YEAR(birth_date) >= 1950 AND YEAR(birth_date) < 1960 THEN '50s' END AS generation FROM salaries AS s INNER JOIN employees AS e ON s.emp_no = e.emp_no WHERE YEAR(birth_date) >= 1950 AND YEAR(birth_date) < 1970 GROUP BY CASE WHEN YEAR(birth_date) >= 1960 AND YEAR(birth_date) < 1970 THEN '60s' WHEN YEAR(birth_date) >= 1950 AND YEAR(birth_date) < 1960 THEN '50s' END;
  2. SELECT MAX(salary) AS max_salary, CONCAT(FLOOR((YEAR(birth_date) - 1900)/10)\*10, 's') AS generation FROM salaries AS s INNER JOIN employees AS e ON s.emp_no = e.emp_no WHERE YEAR(birth_date) BETWEEN 1950 AND 1969 GROUP BY CONCAT(FLOOR((YEAR(birth_date) - 1900)/10)\*10, 's');
