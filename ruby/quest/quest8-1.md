# ハッシュ

# ハッシュと配列は何が違うのか

- 配列は格納されたデータを順番をつけて管理する。[]内にデータを格納する。格納する際は一つ一つ,で区切る。
  順番どおりなので、データを呼び出すときは前から 0、1、2...といった具合に、インデックスと呼ばれる各データに割り振られた番号を指定する。
  配列では順番が重要で、例えば[1,2,3]という配列と[1,3,2]という配列は同一ではないとみなされる。
  順番を保証する配列では、順番にデータを取り出すプログラムを作成する時に使うと便利である。

- ハッシュはキーと値をペアにしてデータを管理する。キーは任意の文字列（言葉）をつけることができ、例えば{'赤' => 'RED'}といった具合にキーから値を連想しやすくなる。
  配列のように順番は保証されないので、順番どおりにデータを取り出すプログラムには不向き。
  一方、キーから値を連想しやすいので、任意の値を取り出すようなプログラムには最適である。
  配列のように順番は重要ではないので、例えば{'赤' => 'RED', '青' => 'BLUE'}と{'青' => 'BLUE', '赤' => 'RED'}は同一のハッシュとみなされる。

# ハッシュと配列はそれぞれどのような用途に向いているか

- 配列は順番を保証するので、順番通りにデータを呼び出したい場面では配列を使用したほうがいい。
- ハッシュはキーからその値が連想しやすいので、特定のデータを呼び出すことが多いならハッシュが向いている。