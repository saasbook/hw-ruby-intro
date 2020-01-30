# When done, submit this entire file to the autograder.

# Part 1

def sum arr
  # YOUR CODE HERE
  arr.inject(0, :+)
end

def max_2_sum arr
  # YOUR CODE HERE
  l = arr.length
  if(l == 0)
    return 0
  end
  if(l == 1)
    return arr.first
  end
  return arr.max(2).reduce(:+)
end

def sum_to_n? arr, n
  # YOUR CODE HERE
  l = arr.length
  if(l == 0)
    return false
  end
  if(l == 1)
    return false
  end
  return arr.uniq.combination(2).any? { |a, b| a + b == n }
end

# Part 2

def hello(name)
  # YOUR CODE HERE
  return ("Hello, " + "#{name}")
end

def starts_with_consonant? s
  # YOUR CODE HERE
  return s =~ /\A(?=[a-z])(?=[^aeiou])/i
end

def binary_multiple_of_4? s
  # YOUR CODE HERE
  if s.empty? || s.match(/[^0-1]/)
    return false
  end
  return (s.to_i(2))%4 == 0
end

# Part 3

class BookInStock
# YOUR CODE HERE
  attr_accessor :isbn, :price
    
  def initialize(isbn,price)
      raise ArgumentError, 'ISBN is empty' if isbn.empty?
      raise ArgumentError, 'Price is not positive' if price.to_f <= 0 
      @isbn=isbn
      @price=price
      
  end  
  
  def price_as_string()
      return "$%.2f" % @price
      
  end
end
