# When done, submit this entire file to the autograder.

# Part 1

def sum arr
  # YOUR CODE HERE
  arrsum = 0
  arr.each {|a| arrsum += a}
  return arrsum
end

def max_2_sum arr
  # YOUR CODE HERE
  if arr.empty?
    return 0 
  end
  
  if arr.length == 1
    return arr[0] 
  end
  
  a = arr.sort
  return a[-1] + a[-2]
end

def sum_to_n? arr, n
  # YOUR CODE HERE
  if arr.length < 2
    return false
  end
  
  h = Hash.new()
  arr.each{|a|
  if h.key? a
    return true
  else
    h[n-a] = a
  end
  }
  
  return false
  
end

# Part 2

def hello(name)
  # YOUR CODE HERE
  'Hello, ' + name
end

def starts_with_consonant? s
  # YOUR CODE HERE
  if s == ''
    return false
  end
  
  return /^[AEIOU\W]/i.match(s) == nil
end

def binary_multiple_of_4? s
  # YOUR CODE HERE
  if s == "0"
    return true
  elsif s == ""
    return false
  end
  
  return ( s.to_i(2) % 4 == 0 ) && ( s =~ /\A[0-9]+/ )
end

# Part 3

class BookInStock
# YOUR CODE HERE
  def initialize(isbn, price)
    if isbn == '' || price <= 0
      raise ArgumentError
    end
    @isbn = isbn
    @price = price
  end
  
  def price_as_string
        return "$%0.2f" % @price
  end
  
  def isbn
    @isbn
  end
  
  def price
    @price
  end
  
  def isbn=(new_isbn)
    @isbn = new_isbn
  end

  def price=(new_price)
    @price = new_price
  end
  
end
