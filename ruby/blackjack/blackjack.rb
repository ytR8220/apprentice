# frozen_string_literal: true

require_relative './lib/game'

game = Game.new # ゲームの流れを担うクラスのオブジェクトを生成すると同時にゲームの準備を開始
game.start # ゲームスタートを宣言すると同時に参加者へカードを2枚ずつ配る
game.player_turn # プレイヤーのターン
game.cpu_turn # CPUのターン
game.burst_check # ディーラー以外のプレイヤーが全員バーストかどうかを確認
game.dealer_turn # ディーラーのターン
game.judge  # 勝敗を決める
game.close  # ゲーム終了を宣言
