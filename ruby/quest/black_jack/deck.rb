# frozen_string_literal: true

# デッキクラス
class Deck
  def create_deck(cards)
    cards.shuffle!
  end
end