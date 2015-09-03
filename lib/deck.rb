require_'card'

class Deck

  def initialize
    @cards = populate_deck
  end

  def populate_deck
    cards = []
    Card::SUIT_STRINGS.each do |suit|
      Card::VALUE_STRINGS.each do |value|
        cards << Card.new(suit,value)
      end
    end
    cards
  end

  def count
    @cards.length
  end

  def get_card
    @cards.delete_at(rand(count))
  end
end
