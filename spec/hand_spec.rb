require 'hand'

describe Hand do
  subject(:hand) { Hand.new }
  subject(:empty_hand) { Hand.new }

  let(:card1) { double("card1") }
  let(:card2) { double("card2") }
  let(:card3) { double("card3") }
  let(:jack_club) { double("jack_club", suit: :club, value: :jack) }
  let(:ten_club) { double("ten_club", suit: :club, value: :ten) }
  let(:nine_club) { double("nine_club", suit: :club, value: :nine) }
  let(:eight_club) { double("eight_club", suit: :club, value: :eight) }
  let(:seven_club) { double("seven_club", suit: :club, value: :seven) }
  let(:five_spade) { double("five_spade", suit: :spade, value: :five) }

  it 'initializes as an empty array' do
    expect(hand.cards).to be_empty
  end

  describe '#receive_card' do
    before do
      hand.receive_card(card1)
      hand.receive_card(card2)
      hand.receive_card(card3)
    end

    it 'receives cards' do
      expect(hand.cards).to include(card1)
      expect(hand.cards).to include(card2)
      expect(hand.cards).to include(card3)
    end
  end

  describe '#discard_card' do
    context 'Hand is empty' do
      it 'empty hand should throw an error' do
        expect { hand.discard_card(card1) }.to raise_error(NoSuchCardError)
      end
    end

    context 'Hand not empty' do
      before do
        hand.receive_card(card1)
        hand.receive_card(card2)
      end

      it 'should remove the card specified from hand' do
        hand.discard_card(card1)
        expect(hand.cards).not_to include(card1)
      end

      it 'should remove the card specified from hand' do
        expect { hand.discard_card(card3) }.to raise_error(NoSuchCardError)
      end
    end
  end

  describe '#straight_flush?' do
    before do
      hand.receive_card(jack_club)
      hand.receive_card(ten_club)
      hand.receive_card(nine_club)
      hand.receive_card(eight_club)
    end

    it 'returns true if the hand is a straight flush' do
      hand.receive_card(seven_club)

      expect(hand.straight_flush?).to be true
    end

    it 'returns true if the hand is a straight flush' do
      hand.receive_card(five_spade)

      expect(hand.straight_flush?).to be false
    end

  end
end
