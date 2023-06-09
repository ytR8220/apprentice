# こども発達支援センターと保護者をつなぐアプリ

## 1.一言サービスコンセプト（サービスのキャッチコピーを一言で）

- こども発達支援センターと保護者をつなぐアプリ

## 2.誰のどんな課題を解決するのか？

- センターと保護者の円滑なコミュニケーションを促進するだけでなく、センターの取組みを周知することで、
  センターと保護者の間での認識のズレを解消し、双方の信頼関係を築くことで、保護者の安心を育む。

## 3.なぜそれを解決したいのか？

- 現状、保護者とセンターの間で連絡のやり取りが円滑でないために、行き違いや、認識のズレが生じている。
  避難訓練等の実施も保護者に伝わっておらず、保護者の不安を招いている。

## 4.どうやって解決するのか？

- センターと保護者間で連絡帳のような機能を提供する。
- センターと保護者間でチャットのような機能を提供する。
- センターのスケジュールを保護者に公開する機能を提供する。
- センターの活動を保護者に公開する機能を提供する。
- センターから保護者に対してお知らせを一斉送信する機能を提供する。

## 5.機能要件

- 初期画面はログイン画面
- ログイン機能とログインを記憶しておく機能
- トップページにはセンターからのお知らせやスケジュールが表示される
- センターとのチャット機能
- チャット機能はリアルタイム更新
- 双方写真の投稿、PDF 等文書の投稿ができる
- スクロールで過去のチャットを見れるようにする
- チャット内で検索が出来るようにする
- チャット機能は連絡帳のようにカレンダーから日付を選ぶことでその日のチャットを見れるようにする
- カレンダーにはチャット履歴の有無、写真投稿の有無、センターからのお知らせの有無がわかるようにそれぞれ印をつける
- センターとログインユーザーだけの写真、動画の共有スペース
- センターから保護者に対してお知らせを一斉送信する機能

## 6.非機能要件

- スマホ対応かつ SPA で、ユーザビリティを高める
- データの登録や管理はセンター側が行うことで、保護者の負担を軽減する
- アカウント停止もセンター側でのみ行えるように
- 保護者側ではパスワードとメールアドレスの変更のみ可能
- アカウント停止後もデータを数年保管する（期間は要検討）
- 保護者同士のコミュニケーションは行えないように
- チャット画面は LINE を参考にする
- 今後拡大の可能性があるので、拡張しやすい設計にする（例えば子どもの身長や体重、かかりつけ医等の詳細情報を扱うようにするかもしれない）
- CI/CD を導入する

---

## 名称

- 未定

## アプリの目的

- センター職員と保護者の円滑なコミュニケーションを促進し、
  センターの取り組みを周知することで、保護者の安心を育む。

## 概要

1. こども発達支援センターと保護者をつなぐアプリです。
1. センターでの活動を保護者に公開することができます。
1. センター側と保護者間のコミュニケーションを目的としており、保護者間のコミュニケーションを目的としません。

## When

- 日常的に使えるウェブアプリ

## Where

- ネットに繋がり、ブラウザが使える環境があれば PC、スマホ、タブレットで利用可能

## Who

- こども発達支援センターの職員
- こども発達支援センターに通うお子様の保護者

## what

- こども発達支援センターから保護者への情報共有
- こども発達支援センターと保護者間のコミュニケーション

## Why

- センターでの子どもの様子を知らない保護者が意外と多い
- センターの取組みを知らない保護者が意外と多い（実際に、避難訓練等を実施しているが、それを知らない保護者が多かった）
- 現在は電話連絡と紙媒体の連絡帳やお知らせしかなく色々と不便を感じている
- アンケートが紙媒体のため回収率が低い
- 保護者の年齢も若くなってきて、おそらくネットでのやり取りが求められてくると感じている（実際に LINE 希望の方はいるが、LINE だと距離が近すぎるので現状断っている）

## How

- 連絡帳のような機能を提供する
- TOP ページにはセンターからのお知らせやスケジュールを表示する
- センター側が保護者に対してお知らせを一斉送信できるようにする
- センターと保護者間でチャットのような機能を提供する

## 機能要件

- センターと保護者間で連絡帳のような機能を提供します。
- センターと保護者間でチャットのような機能を提供します。
- センターのスケジュールを保護者に公開する機能を提供します。
- センターの活動を保護者に公開する機能を提供します。
- センターから保護者に対してお知らせを一斉送信する機能を提供します。
- アカウントを作成し、ログイン機能を実装することで、プライバシーを守ります。
- アカウントを停止後もデータは 5 年残しますが、通常時は見えない形にします。
- センターと保護者間で写真の共有機能を提供します。(要検討)
- センターと保護者間で動画の共有機能を提供します。(要検討)

## 非機能要件

- スマホ対応かつ SPA で、ユーザビリティを高めます。
- データの登録や管理はセンター職員が行うことで、保護者の負担を軽減します。
- チャット機能はリアルタイム更新で実装します。
- 今後拡大の可能性があるので、拡張しやすい設計にします。

## 非実装

- プライバシーの観点から、全体が見れる画面での写真や動画の公開は行いません。
- 保護者同士のコミュニケーションは行えません。

## 課題点

- お子様が複数いる家庭の場合、アカウントをどうするか。
- 実際に利用するためには保護者からの同意が必要。

## ターゲットとなる人物像（ペルソナ）

- データの登録や管理
  - 利用者：センター職員（リーダークラス）
  - 年齢：40〜50 代
  - 性別：男女問わず
  - 具体的な人物像：センターの管理職（男性：40 代、PC 操作が得意ではない）
- 保護者とのやり取り
  - 利用者：現場の職員
  - 年齢：20〜40 代
  - 性別：男女問わず
  - 具体的な人物像：センターの現場の職員（女性：20 代、PC よりもスマホ操作に慣れ親しんでいる）
- 保護者側の利用
  - 利用者：保護者
  - 年齢：20〜40 代
  - 性別：女性（ママさん）が多い
  - 具体的な人物像：保護者（母親：30 代、所有デバイスはスマホのみ、WiFi 環境なし）

## 想定ページ

- ログインページ
- トップページ（シンプルに見やすさ重視）
  - お知らせ一覧
  - スケジュール一覧
- チャットページ（LINE を参考にする）
  - チャット画面
  - カレンダー画面（ポップアップ。チャット履歴、写真投稿履歴、センターからのお知らせ履歴がある場合それぞれ印があると良い。クリック or タップでその日付のチャットの一番古いやり取りから表示させる）
  - 検索窓（画面上部）
  - 下が最新チャット、上に行くほど古いチャット
  - 写真投稿機能
- 写真動画共有スペース
  - 投稿不可
  - 保存可能
- 利用規約
- プライバシーポリシー
