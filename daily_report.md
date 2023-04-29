# 2023.4.28 の日報

## 本日の目標（TODO 目標/できるようになりたいこと）

- Linux の Quest をどの環境で行うか決める（Docker、AWS、UTM）

## 学習時間(total)

- 5h(100h)

## 目標振り返り（TODO 進捗/できるようになりたいこと振り返り）

- Linux の Quest は Docker で進めることに決定。
  理由 →① 現場の開発でよく使われていそうだから。② 今後の Quest やオリジナルプロダクト開発に使えそうだから。③ 学ぶうちに楽しくなってきたから

## 詰まっていること（実現したいこと/現状/行ったこと/仮説）

- 特になし

## 学んだこと（新しい気付き、学び）

- dockerfile からイメージを作成（docker build -t [name]:[tag] path）し、コンテナを起動(docker run --name [name] -it [name]:[tag])することに成功
- 停止中のコンテナを開始(docker start [name])
- コンテナを停止(docker stop [name])
- 起動中のコンテナにインタラクティブモードで入る(docker exec -it [name] /bin/bash)

## 感想（一日の感想、雑談）

- Docker が楽しくなってきた！明日は Linux の Quest を進めながら、Docker 内のファイルとローカル上のファイルを同期させてみたい。

## 明日の目標（TODO 目標/できるようになりたいこと）

- 提出 Quest 以外の Linux の Quest を全て完了する
