# When done, submit this entire file to the autograder.

# Part 1

def sum arr
  # YOUR CODE HERE
  
  # Show sum arr function
  arr.inject(0){ |sum, x| sum + x }
end

def max_2_sum arr
  # YOUR CODE HERE
  
  # Show max_2_sum arr function
  sum(arr.sort.last(2))
end

def sum_to_n? arr, n
  # YOUR CODE HERE
  
  # Show sum_to_n? arr, n function
  !!arr.uniq.combination(2).detect{|a,b| a + b == n}
end

# Part 2

def hello(name)
  # YOUR CODE HERE
  
  # Say greeting and list name
  "Hello, " + name
end

def starts_with_consonant? s
  # YOUR CODE HERE
  
  # Start consonants with s
  /^[^aeiouAEIOU\d\W]/i =~ s ? true : false
end

def binary_multiple_of_4? s
  # YOUR CODE HERE
  
  # Show multiple of 4 in binary
  return false if s.empty? || s =~ /[^01]/
  (s == '0') || s.end_with?('00')
end

# Part 3

class BookInStock
# YOUR CODE HERE
  
  # Initialize variables for ISBN and price
  attr_accessor :isbn, :price
  
  # Display error messages if ISBN is empty and/or price is 0
  def initialize isbn, price
    raise ArgumentError.new("ISBN is empty") unless isbn.length > 0
    raise ArgumentError.new("Price should be larger than 0") unless price > 0
    @isbn = isbn
    @price = Float(price)
  end
  
  # Display the ISBN and price
  def price_as_string
    format("$%.2f", @price)
  end

end
