require 'deck'

describe Deck do

  context 'No cards dealt to players' do
    subject(:deck) { Deck.new }

    describe '#initialize' do
      it 'should populate with 52 cards' do
        expect(deck.instance_variable_get(:@cards).length).to eql(52)
      end

      it 'should not have duplicated cards' do
        uniq_cards = deck.instance_variable_get(:@cards).uniq
        expect(uniq_cards).to eql(deck.instance_variable_get(:@cards))
      end
    end

    describe '#count' do
      it 'should return the number of cards left' do
        expect(deck.count).to eql(52)
      end
    end
  end

  context 'Card dealing' do
    subject(:deck) { Deck.new }

    describe '#get_card' do
      it 'should remove cards from deck' do
        7.times { deck.get_card }
        expect(deck.count).to eql(45)
      end

      it 'should return a card' do
        expect(deck.get_card).to be_a(Card)
      end
    end
  end

end
