# frozen_string_literal: true

require_relative '../lib/ruby_intro.rb'

describe '#hello' do
  it 'should be defined' do
    expect { hello('Testing') }.not_to raise_error#::NoMethodError)
  end

  it 'The hello method returns the correct string [30 points]', points: 30 do
    expect(hello('Dan').class).to eq(String)
    expect(hello('Dan')).to eq('Hello, Dan'), 'Incorrect results for input: "Dan"'
    expect(hello('BILL')).to eq('Hello, BILL'), 'Incorrect results for input: "BILL"'
    expect(hello('Mr. Ilson')).to eq('Hello, Mr. Ilson'), 'Incorrect results for input: "Mr. Ilson"'
  end
end

describe '#starts_with_consonant?' do
  it 'should be defined' do
    expect { starts_with_consonant?('d') }.not_to raise_error#::NoMethodError)
  end
  it 'classifies true cases [10 points]' , points: 10 do
    expect(starts_with_consonant?('v')).to be_truthy, "'v' is a consonant"
    %w[v vest Veeee crypt].each do |string|
      expect(starts_with_consonant?(string)).to be_truthy, "Incorrect results for input: \"#{string}\""
    end
  end
  it 'classifies false cases [10 points]' , points: 10 do
    expect(starts_with_consonant?('a')).to be_falsy, "'a' is not a consonant"
    %w[asdfgh Unix].each do |string|
      expect(starts_with_consonant?(string)).to be_falsy, "Incorrect results for input: \"#{string}\""
    end
  end
  it 'works on the empty string [5 points]' , points: 5 do
    expect(starts_with_consonant?('')).to be_falsy
  end
  it 'works on nonletters [5 points]' , points: 5 do
    expect(starts_with_consonant?('#foo')).to be_falsy
  end
end

describe '#binary_multiple_of_4?' do
  it 'should be defined' do
    expect { binary_multiple_of_4?('yes') }.not_to raise_error#::NoMethodError)
  end
  it 'classifies valid binary numbers [30 points]' , points: 30 do
    %w[1010101010100 0101010101010100 100 0].each do |string|
      expect(binary_multiple_of_4?(string)).to be_truthy,  "Incorrect results for input: \"#{string}\""
    end
    %w[101 1000000000001].each do |string|
      expect(binary_multiple_of_4?(string)).not_to be_truthy,  "Incorrect results for input: \"#{string}\""
    end
  end
  it 'rejects invalid binary numbers [10 points]' , points: 10 do
    expect(binary_multiple_of_4?('a100')).to be_falsy, "'a100' is not a valid binary number!"
    expect(binary_multiple_of_4?('')).to be_falsy, 'The empty string is not a valid binary number!'
  end
end
