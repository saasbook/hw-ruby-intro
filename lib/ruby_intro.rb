# When done, submit this entire file to the autograder.

# Part 1

def sum arr
  arr.reduce 0, :+
  # YOUR CODE HERE
end

def max_2_sum arr
  sum(arr.sort.last(2))
  # YOUR CODE HERE
end

def sum_to_n? arr, n
  (arr.empty? && n.zero?) || arr.permutation(2).any? { |a, b| a + b == n }
  # YOUR CODE HERE
end

# Part 2

def hello(name)
  "Hello, " + name
  # YOUR CODE HERE
end

def starts_with_consonant? s
  !!(s[0] =~ /[bcdfghjklmnprstvwxyz]+/i)
  # YOUR CODE HERE
end

def binary_multiple_of_4? s
  if s =~ /^[0-1]+$/
    return s.to_i(2) % 4 == 0 unless s == "0"
  end
  false
  # YOUR CODE HERE
end

# Part 3

class BookInStock
  
  attr_accessor :isbn, :price

  def initialize isbn, price
    raise ArgumentError if isbn.empty? || price <= 0
    @isbn = isbn
    @price = price
  end

  def price_as_string
    format("$%.2f", @price)
  end
# YOUR CODE HERE
end
