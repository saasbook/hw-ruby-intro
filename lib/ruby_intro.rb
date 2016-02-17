# When done, submit this entire file to the autograder.

# Part 1

def sum arr
  arr.empty? ? 0 : arr.reduce(:+)
end

def max_2_sum arr
  arr.empty? ? 0 : arr.length == 1 ? arr.first : arr.sort.last(2).reduce(:+)
end

def sum_to_n? arr, n
  arr.combination(2).any? do |first, second|
    first + second == n
  end
end

# Part 2

def hello(name)
  "Hello, #{name}"
end

def starts_with_consonant? s
  s.length > 0 && s !~ /^[AEIOU_\d\W]/i
end

def binary_multiple_of_4? s
  s.length > 0 && s.to_i(2) % 4 == 0 && s !~ /^[:alpha]/
end

# Part 3

class BookInStock
  
  attr_accessor :isbn, :price

  def initialize(isbn, price)
    raise ArgumentError if isbn.empty? || price <= 0
    @isbn = isbn
    @price = price
  end
  
  def price_as_string
    "$%.2f" % price
  end

end
