# Cookie とセッションについて説明できる

## 1. ステートレス

- ステートレスとは、状態を持たないという意味であり、HTTP はステートレスなプロトコルである。
  つまり HTTP は、一度受けたリクエストはそれだけで完結し、次のリクエストとは何の関係もないということである。

## 2. Cookie とセッション

- Cookie とは、Web サーバーから Web ブラウザに送られる情報のことであり、Web ブラウザは Cookie を保存しておき、次回以降のアクセス時に Web サーバーに送信することが出来る。
- セッションとは、Web サーバー側で管理される情報のことであり、Web ブラウザに Cookie として保存される。
- Cookie にはログイン情報やユーザーの設定などを保存でき、有効期限を指定することもできるが、Web ブラウザ上に保存されるため、Cookie を盗まれると、その Cookie を使用してログインすることができてしまう。
- セッションはサーバー側のメモリに保存される。Cookie にはセッション ID が保存されており、Web ブラウザから送信されたセッション ID を元に、サーバー側でセッション情報を取得することができる。セッションはブラウザを閉じることで終了する。
- 通常、ログイン状態の実現には、Cookie とセッションを組み合わせて使用する。初めて（久しぶりに）ログインがあった際、一意のセッション ID とともにログイン情報をサーバー上に保存し、Cookie にセッション ID を保存する。次回以降のアクセス時には、Cookie に保存されたセッション ID を元に、サーバー上のセッション情報を取得し、ログイン状態を維持する。
