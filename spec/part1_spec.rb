describe "#sum" do
  it "should be defined" do
    expect { sum([1,3,4]) }.not_to raise_error
  end

  it "returns the correct sum" do
    sum([1,2,3,4,5]).should be_a_kind_of Fixnum
    sum([1,2,3,4,5]).should == 15
    sum([1,2,3,4,-5]).should == 5
  end
end
describe "#max_2_sum" do
  it "should be defined" do
    expect { max_2_sum([1,2,3]) }.not_to raise_error
  end
  it "returns the correct sum" do
    max_2_sum([1,2,3,4,5]).should be_a_kind_of Fixnum
    max_2_sum([1,2,3,4,100]).should == 104
    max_2_sum([1,-2,-3,-4,-5]).should == -1
  end
end
describe "#sum_to_n?" do
  it "should be defined" do
    expect { sum_to_n?([1,2,3],4) }.not_to raise_error
  end
  it "returns the correct value" do
    sum_to_n?([1,2,3,4,5], 5).should be_true
    sum_to_n?([1,2,5,6,7,8], 3).should be_true
    sum_to_n?([100,50,50,2,100,4,5], 100).should be_true
    sum_to_n?([1,2,3,4,5], -3).should be_false
  end
end
