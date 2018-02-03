# When done, submit this entire file to the autograder.

# Part 1

def sum(ary)
  ary.sum
end

def max_2_sum(ary)
  return ary.max || 0 if ary.length < 2

  pairs = ary.map.each_cons(2)
  sums  = pairs.map(&:sum)

  sums.max
end

def sum_to_n?(ary, n)
  pairs = ary.map.each_cons(2)
  sums  = pairs.map(&:sum)

  sums.include?(n)
end

# Part 2

def hello(name)
  "Hello, #{name}"
end

def letter?(s)
  /[A-Za-z]+/ =~ s
end

def starts_with_consonant?(s)
  vowels  = 'aeoui'
  initial = s.chars.first

  letter?(initial) && !vowels.include?(initial.downcase)
end

def binary_multiple_of_4?(s)
  rem = Integer(s, 2) % 4
  rem.zero?
rescue ArgumentError
  false
end

# Part 3

class BookInStock
  def initialize(isbn, price)
    raise ArgumentError if !isbn_valid?(isbn)
    raise ArgumentError if !price_valid?(price)

    self.isbn  = isbn
    self.price = price
  end

  def price_as_string
    '$%.2f' % price
  end

  attr_accessor :isbn, :price

  private

  def isbn_valid?(isbn)
    isbn.is_a?(String) && !isbn.empty?
  end

  def price_valid?(price)
    (price.is_a?(Integer) || price.is_a?(Float)) && price.positive?
  end
end
