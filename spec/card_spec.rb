require 'card'

describe Card do
  subject(:example_card) { Card.new(:clubs, :four) }

  describe '#initialize' do
    it 'can be initialized with a value and suit' do

      expect(example_card.suit).to eql(:clubs)
      expect(example_card.value).to eql(:four)
    end
  end

  describe '.suits' do
    it 'should return array of suits' do
      expect(Card.suits).to eql([:clubs, :diamonds, :hearts, :spades])
    end
  end

  describe '.values' do
    it 'should return array of values' do
      expect(Card.values).to eql([:deuce, :three, :four, :five, :six, :seven,
                                  :eight, :nine, :ten, :jack, :queen, :king, :ace])
    end
  end

  describe '#==' do
    subject(:same_example_card) { Card.new(:clubs, :four) }
    subject(:other_example_card) { Card.new(:clubs, :five) }

    it 'should compare cards by value and suit' do
      boolean = (example_card == same_example_card)
      expect(boolean).to be true
    end

    it 'should compare cards by value and suit' do
      boolean = (example_card == other_example_card)
      expect(boolean).to be false
    end
  end

  describe '#to_s' do
    it 'should return the stringified card' do
      expect(example_card.to_s).to eql("4♣")
    end
  end
end
