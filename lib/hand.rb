require_relative 'card.rb'
require_relative 'deck.rb'

class Hand
  ORDERED_CARDS = [:deuce, :three, :four, :five, :six, :seven, :eight,
                   :nine, :ten, :jack, :queen, :king, :ace]

  attr_reader :cards

  def initialize
    @cards = []
  end

  def receive_card(card)
    @cards << card unless card.nil?
  end

  def discard_card(card)
    raise NoSuchCardError if @cards.empty? || !@cards.include?(card)
    @cards.delete(card)
  end

  def straight_flush?
    straight? && flush?
  end

  def four_of_a_kind?
    hand_hash.values.include?(4)
  end

  def full_house?
    hand_hash.values.include?(3) && hand_hash.values.count == 2
  end

  def flush?
    cards.map { |card| card.suit }.uniq.length == 1
  end

  def straight?
    return false unless cards.uniq.length == 5

    cards_index_array = cards.map { |card| ORDERED_CARDS.index(card.value) }
    cards_index_array.max - cards_index_array.min == 4
  end

  def three_of_a_kind?
    hand_hash.values.include?(3)
  end

  def two_pair?
    hand_hash.values.include?(2) && hand_hash.values.count == 3
  end

  def one_pair?
    hand_hash.values.include?(2) && hand_hash.values.count == 4
  end

  def high_card
    if [9, 6, 5, 1].include?(hand_rank)
      return cards.map { |card| card.value }.max
    elsif hand_rank == 8
      hand_hash.select { |_, count| count == 4 }.keys[0]
    elsif hand_rank == 7 || hand_rank == 4
      hand_hash.select { |_, count| count == 3 }.keys[0]
    elsif hand_rank == 3
      keys = hand_hash.select { |_, count| count == 2 }.keys
      if ORDERED_CARDS.index(keys[0]) > ORDERED_CARDS.index(keys[1])
        return keys[0]
      else
        return keys[1]
      end
    else
      hand_hash.select { |_, count| count == 2 }.keys[0]
    end
  end

  def hand_rank
    return 9 if straight_flush?
    return 8 if four_of_a_kind?
    return 7 if full_house?
    return 6 if flush?
    return 5 if straight?
    return 4 if three_of_a_kind?
    return 3 if two_pair?
    return 2 if one_pair?
    1
  end

  def hand_hash
    hash = Hash.new(0)
    cards.each do |card|
      hash[card.value] += 1
    end

    hash
  end
end

class NoSuchCardError < StandardError
end
