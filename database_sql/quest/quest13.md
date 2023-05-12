# サブクエリを使うことができる

## 1.サブクエリ

- 従業員番号が 10001 から 10010 のうち、全給与レコードの平均給与より給与が大きいレコードの従業員番号と給与を、サブクエリを使用して取得する場合
  SELECT emp_no salary FROM salaries WHERE emp_no 10001 AND 10010 AND salary > (SELECT AVG(salary) FROM salaries);
  ※上記はスカラ・サブクエリである。

## 2.重複なし

- 平均の 2 倍以上の給与をもらっている従業員の従業員番号を重複なく取得する場合
  SELECT DISTINCT emp_no FROM salaries WHERE salary > (SELECT AVG(salary)\*2 FROM salaries);

## 3.最大給与

- 従業員番号が 10001 から 10010 のうち、全給与レコードの平均給与より給与が大きい従業員の従業員番号と最大給与を取得する場合
  SELECT emp_no, MAX(salary) AS max_salary FROM salaries WHERE emp_no BETWEEN 10001 AND 10010 AND salary > (SELECT AVG(salary) FROM salaries) GROUP BY emp_no;

## 4.相関サブクエリ

- 従業員のうち、性別ごとに最高年齢の従業員の性別、従業員番号、誕生日を、相関サブクエリを使用して取得する場合
  1）SELECT emp_no, gender, birth_date FROM employees AS emp1 WHERE birth_date = (SELECT MIN(birth_date) FROM employees AS emp2 WHERE emp1.gender = emp2.gender group by gender);
  2）SELECT emp_no, gender, birth_date FROM employees WHERE (gender, birth_date) IN (SELECT gender, MIN(birth_date) FROM employees GROUP BY gender);
  3）SELECT emp_no, gender, birth_date FROM employees WHERE birth_date = (SELECT MIN(birth_date) FROM employees WHERE gender = 'M') AND gender = 'M' OR birth_date = (SELECT MIN(birth_date) FROM employees WHERE gender = 'F') AND gender = 'F' ORDER BY gender, emp_no;

## 5.一番若い従業員

- 従業員番号 10100 から 10200 の従業員の中で、それぞれの性別で最も若い年齢の人の性別、誕生日、従業員番号、ファーストネーム、ラストネームを取得する場合
  SELECT emp_no, gender, birth_date, first_name, last_name FROM employees WHERE emp_no BETWEEN 10100 AND 10200 AND (gender, birth_date) IN (SELECT gender, MAX(birth_date) FROM employees WHERE emp_no BETWEEN 10100 AND 10200 GROUP BY gender);
