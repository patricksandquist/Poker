require 'array'

describe Array do
  let(:empty_array) { [] }

  describe '#my_uniq' do
    let(:full_array) { [1,2,4,2,3,4,5,6] }

    it "returns array without duplicate values" do
      expect(full_array.my_uniq).to eql([1,2,4,3,5,6])
    end

    it "returns an empty array when given an empty array" do
      expect(empty_array.my_uniq).to be_empty
    end
  end

  describe "#two_sum" do
    let(:array_with_pairs) { [-1,9,-4,3,-3,1,4,5] }
    let(:no_pairs_array) { [1,2,3,4,5] }

    it "returns indicies of zero sum pairs" do
      expect(array_with_pairs.two_sum).to eql([[0,5],[2,6],[3,4]])
    end

    it "returns an empty array if no pairs sum to 0" do
      expect(no_pairs_array.two_sum).to be_empty
    end
  end

  describe "#my_transpose" do
    let (:two_dimensional_array) { [[1,2,3],[4,5,6]] }

    it "returns a tranposed matrix" do
      expect(two_dimensional_array.my_transpose).to eql(two_dimensional_array.transpose)
    end

    it "returns an empty array if given one" do
      expect(empty_array.my_transpose).to be_empty
    end
  end

  describe "#stock_picker" do
    let (:stock_array) { [8, 4, 2, 7, 3, 634, 56] }

    it "returns pair of days that have the highest profit" do
      expect(stock_array.stock_picker).to eql([2, 5])
    end

    it "raises an error if given no stocks" do
      expect {empty_array.stock_picker}.to raise_error(RuntimeError, "No stocks bought or sold.")
    end
  end
end
