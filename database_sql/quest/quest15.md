# 実行計画を確認できる

## 1.実行計画

- 実行計画とは、データベースが、クエリが必要とするデータをどのように取得してくるのか計画を立てること。データベースは、目的のデータまで複数あるルートの中から一つのルートを決定する。
  実行計画は確認することができ、実行計画を確認することでどの処理に時間がかかっているのかなどを知ることができ、パフォーマンス向上に役立つ。

## 4.高速なクエリ

- WHERE salary = 70575 とするよりも WHERE emp_id = 10100 とした方が実行時間が短い理由はスキャン方法の違いである。前者はフルスキャンといって全ての行を順番にスキャンを行っているのに対して、後者はレンジスキャンといって、索引をもちいてピンポイントでスキャンを行っている。索引を利用するにはインデックスが必要であり、今回 emp_id がインデックスだったため高速な処理が可能だった。