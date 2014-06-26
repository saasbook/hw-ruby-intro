require 'rspec'
require 'rspec/mocks'

describe "#hello" do
  it "should be defined" do
    expect { hello("Testing") }.not_to raise_error(::NoMethodError)
  end

  it "The hello method prints the correct string" do
    hello("Dan").class.should == String
    hello("Dan").should eq('Hello, Dan'), "Incorrect results for input: \"Dan\""
  end
end
describe "#starts_with_consonant?" do
  it "should be defined" do
    expect { starts_with_consonant?("d") }.not_to raise_error(::NoMethodError)
  end
  it "The starts_with_consonant? method returns the correct boolean" do
    starts_with_consonant?("asdfgh").should_not be_true, "Incorrect results for input: \"asdfgh\""
    starts_with_consonant?("Veeeeeeee").should be_true, "Incorrect results for input: \"Veeeeeeee\""
  end
end
describe "#binary_multiple_of_4?" do
  it "should be defined" do
    expect { binary_multiple_of_4?("yes") }.not_to raise_error(::NoMethodError)
  end
  it "The binary_multiple_of_4? method returns the correct boolean" do
    binary_multiple_of_4?("111111101").should_not be_true, "Incorrect results for input: \"111111101\""

    binary_multiple_of_4?("1010101010100").should be_true, "Incorrect results for input: \"1010101010100\""
  end
end
