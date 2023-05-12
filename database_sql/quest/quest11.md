# テーブルを結合できる

## 1.内部結合

- SELECT \* FROM <結合先のテーブル名> INNER JOIN <結合元となるテーブル名> ON <結合先テーブルの結合キー> = <結合元テーブルの結合キー>;

## 2.列の選択

- 部署ごとに、部署番号、歴代のマネージャーの従業員番号、マネージャーのファーストネーム、マネージャーのラストネームを取得する場合
  SELECT dept_no, dept_manager.emp_no, first_name, last_name FROM dept_manager INNER JOIN employees ON dept_manager.emp_no = employees.emp_no;

## 3.複数の内部結合

- 部署ごとに、部署番号、部署名、歴代のマネージャーの従業員番号、マネージャーのファーストネーム、マネージャーのラストネームを取得する場合
  SELECT dept_manager.dept_no, dept_name, dept_manager.emp_no, first_name, last_name FROM dept_manager INNER JOIN employees ON dept_manager.emp_no = employees.emp_no INNER JOIN departments ON dept_manager.dept_no = departments.dept_no;

## 4.絞り込み

- 部署ごとに、部署番号、部署名、現在のマネージャーの従業員番号、マネージャーのファーストネーム、マネージャーのラストネームを取得する場合
  SELECT dept_manager.dept_no, dept_name, dept_manager.emp_no, first_name, last_name FROM dept_manager INNER JOIN employees ON dept_manager.emp_no = employees.emp_no INNER JOIN departments ON dept_manager.dept_no = departments.dept_no WHERE to_date = '9999-01-01';

## 5.給与

- SELECT employees.emp_no, first_name, last_name, MIN(from_date), MAX(to_date), SUM(salary) FROM employees INNER JOIN salaries ON employees.emp_no = salaries.emp_no WHERE employees.emp_no BETWEEN 10001 AND 10010 GROUP BY employees.emp_no;

## 6.内部結合と外部結合の違い

- 内部結合（INNER JOIN） も 外部結合（OUTER JOIN） も、2 つ以上のテーブルを共通の結合キーでつなぎ、どちらのカラムも選択できるようにするという点では一緒だが、外部結合の場合、どちらのテーブルを主（マスター）とするかで結果が変わる可能性がある。というのも、マスターとなったテーブルのカラムは全て結果として表示される。これは共通の結合キーがなくても結果として出力されるという意味である。つまり、元のテーブルにない情報を結果として出力したい場合は外部結合を利用し、テーブル内部の情報にとどめたい場合は内部結合を利用する。
