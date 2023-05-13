# N+1 問題の対策ができる

## 1.N+1 問題

- SQL ではデータを取得するためにデータベースへのアクセス（SELECT）する必要がある。もちろんその数が多ければ多いほどにパフォーマンスは悪くなる。例えば、一覧データの取得と、関連する各データの取得をそれぞれバラバラに行うと、一覧データの取得に SELECT を 1 回、関連する各データの取得に SELECT を N 回実行するというような状況がまさに N+1 問題である。
  この問題の厄介なところは、エラーなどは起こらず、データ量が少なければ問題にもならないので気づきにくく、データ量が膨大になって初めて気づくというケースも少なくない。

## 2.N+1 問題対策

- JOIN 句をつかってテーブルを結合することで一度の SELECT ですべてのデータを取得できるので N+1 問題は解決できる。
  また、N+1 問題を検出するライブラリ（bullet）を用いて検知することで N+1 問題を回避することができる。