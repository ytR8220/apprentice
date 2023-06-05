# MVC について説明できる

## 1. MVC とは

- MVC とは、プログラムを 3 つの役割（モデル、ビュー、コントローラー）に分けて管理する設計モデルのことであり、システムの保守性、生産性の向上を目的としている。
- M は Model のことであり、Model は主にデータベースとやり取りを行う部分のことであり、主にデータベースとコントローラーの間に位置する。また、データベースとのやり取り以外に、ロジックの管理等もここで行う。
- V は View のことであり、View は表示画面を作成する部分のことであり、コントロールから受け取ったデータを表示する画面を作成する。
- C は Controller のことであり、Controller は Model と View の橋渡し役のことであり、ユーザーから受け取ったリクエストを Model に伝え、Model から受け取ったデータを View に伝える。また、View の画面もコントローラーを通してユーザーに返す。
- 一連の流れ
  - 1.ユーザーからリクエストがある
  - 2.コントローラーがリクエストを受け取る
  - 3.コントローラーからモデルにリクエストを伝える
  - 4.データベースとのやり取りが必要であれば、モデルがデータベースとやり取りする
  - 5.データを取得したモデルは取得結果をコントローラーに返す
  - 6.コントローラーは取得結果をビューに伝える
  - 7.ビューは受け取ったデータをもとに表示画面をコントローラーに返す
  - 8.コントローラーはユーザーの画面に受け取った表示画面を返す
  - 9.ユーザーは欲しかった画面を見ることができる