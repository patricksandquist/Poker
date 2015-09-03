class Array
  def my_uniq
    output = []
    self.each do |el|
      output << el unless output.include?(el)
    end
    output
  end

  def two_sum
    pairs = []
    (0...self.length - 1).each do |i|
      (i...self.length).each do |j|
        pairs << [i, j] if self[i] + self[j] == 0
      end
    end
    pairs
  end

  def my_transpose
    return [] if self.empty?
    row1 = self[0]
    row1.zip(*self.drop(1))
  end

  def stock_picker
    raise "No stocks bought or sold." if self.empty?

    best_pair = nil
    highest_value = nil
    (0...self.length - 1).each do |i|
      (i...self.length).each do |j|
        if highest_value.nil? || self[j] - self[i] > highest_value
          highest_value = self[j] - self[i]
          best_pair = [i, j]
        end
      end
    end

    best_pair
  end
end
