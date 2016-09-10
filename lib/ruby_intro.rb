# Part 1

def sum arr
  arr.empty? ? 0 : arr.reduce(:+)
end

def max_2_sum arr
  (arr.sort![-1] || 0) + (arr.sort![-2] || 0)
end

def sum_to_n? arr, n
  arr.combination(2).to_a.each {|pair|
    return true if n == pair[0] + pair[1]
  }
  false
end

# Part 2

def hello(name)
  "Hello, #{name}"
end

def starts_with_consonant? s
  s =~ /\A[^aeiou]/i if (s =~ /\A\D/ && s =~ /\A[a-z]/i)
end

def binary_multiple_of_4? s
  s =~ /(0)+\Z/ && s =~ /[01]{#{s.length}}/
end

# Part 3

class BookInStock
  def initialize(isbn, price)
    if isbn.empty? || price <= 0
      raise ArgumentError
    end
    @isbn = isbn if isbn.instance_of? String
    @price = price
  end

  #getters
  def isbn
    @isbn
  end

  def price
    @price
  end

  #setters
  def isbn=(isbn)
    @isbn = isbn
  end

  def price=(price)
    @price = price
  end

  #price instance method
  def price_as_string
    "$#{"%.2f" % @price}"
  end
end
