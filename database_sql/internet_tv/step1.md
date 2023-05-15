# ステップ 1

## エンティティ

- 【チャンネル】

  - チャンネル ID
  - チャンネル名

- 【番組】

  - 番組 ID
  - ジャンル ID
  - 番組名
  - 番組詳細

- 【エピソード】

  - エピソード ID
  - エピソード名
  - エピソード詳細
  - 公開日
  - 視聴数
  - シーズン ID

- 【シーズン】

  - シーズン ID
  - シーズン名
  - 番組 ID

- 【ジャンル】

  - ジャンル ID
  - ジャンル名

- 【番組表】
  - チャンネル ID
  - 開始日時
  - 終了日時
  - 番組 ID
  - エピソード ID

## テーブル設計

【チャンネル】
|カラム名|データ型|NULL|制約|初期値|AUTO INCREMENT|
|チャンネル ID|INT|NOT|PRIMARY KEY|||
|チャンネル名|VARCHAR(20)|NOT|INDEX, UNIQUE|||

【放送番組】
|カラム名|データ型|NULL|制約|初期値|AUTO INCREMENT|
|チャンネル ID|INT|NOT|PRIMARY KEY,FOREIGN KEY【チャンネル】|||
|番組 ID|INT|NOT|PRIMARY KEY,FOREIGN KEY 【番組】|||

【番組】
|カラム名|データ型|NULL|制約|初期値|AUTO INCREMENT|
|番組 ID|INT|NOT|PRIMARY KEY||YES|
|ジャンル ID|INT|NOT|FOREIGN KEY 【ジャンル】|||
|番組名|VARCHAR(20)|NOT||||
|番組詳細|VARCHAR(100)|NOT||||

【エピソード】
|カラム名|データ型|NULL|制約|初期値|AUTO INCREMENT|
|エピソード ID|INT|NOT|PRIMARY KEY||YES|
|エピソード名|VARCHAR(20)|NOT|UNIQUE,INDEX|||
|エピソード詳細|VARCHAR(100)|NOT||||
|公開日|DATE|NOT||||
|視聴数|BIGINT|NOT||0|
|シーズン ID|INT|NOT|FOREIGN KEY 【シーズン】|0||

【シーズン】
|カラム名|データ型|NULL|制約|初期値|AUTO INCREMENT|
|シーズン ID|INT|NOT|PRIMARY KEY||YES|
|番組 ID|INT|NOT|FOREIGN KEY 【番組】|||
|シーズン名|VARCHAR(20)|NOT||||

【ジャンル】
|カラム名|データ型|NULL|制約|初期値|AUTO INCREMENT|
|ジャンル ID|INT|NOT|PRIMARY KEY||YES|
|ジャンル名|VARCHAR(20)|NOT|UNIQUE,INDEX|||

【番組表】
|カラム名|データ型|NULL|制約|初期値|AUTO INCREMENT|
|チャンネル ID|INT|NOT|PRIMARY KEY,FOREIGN KEY|||
|開始日時|DATETIME|NOT|PRIMARY KEY|||
|終了日時|DATETIME|NOT||||
|番組 ID|INT|NOT|FOREIGN KEY 【番組】|||
|エピソード ID|INT|NOT|FOREIGN KEY 【エピソード】|0||
