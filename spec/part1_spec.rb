require 'ruby_intro.rb'
describe 'Ruby intro part 1' do
  describe "#sum" do
    it "returns correct sum" do
      expect(sum([1,2,3,4,5])).to eq(15)
    end
    it "works on the empty array" do
      expect(sum([])).to be_zero
    end    
  end

  describe "#max_2_sum" do
    it "returns the correct sum" do
      expect(max_2_sum([1,-2,-3,-4,-5])).to eq(-1)
    end
    it 'works even if 2 largest values are the same' do
      expect(max_2_sum([1,2,3,3])).to eq(6)
    end
    it "returns zero if array is empty" do
      expect(max_2_sum([])).to be_zero
    end
    it "returns value of the element if just one element" do
      expect(max_2_sum([3])).to eq(3)
    end
  end

  describe "#sum_to_n" do
    it "returns true when any two elements sum to the second argument" do
      expect(sum_to_n?([3,0,5], 5)).to be true
    end
    
    it "returns false for the single element array" do
      expect(sum_to_n?([1], 1)).to be_falsey
    end
    it "returns false for the empty array" do
      expect(sum_to_n?([], 0)).to be_falsey
    end
  end
end
