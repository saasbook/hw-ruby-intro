# When done, submit this entire file to the autograder.

# Part 1

def sum arr
  # https://ruby-doc.org/core-2.4.0/Array.html
  return 0 if arr.empty?
  sum = 0
  arr.each do |element| 
    sum += element
  end
  return sum
end

def max_2_sum arr
  # https://ruby-doc.org/core-2.4.0/Array.html
  return 0 if arr.empty?
  return arr[0] if arr.length == 1
  max1 = arr[0]
  max2 = arr[1]
  arr[2..(arr.length-1)].each do |element| 
    if max1 < element then
      max1 = element
    elsif max2 < element then
      max2 = element
    end
  end
  sum = max1 + max2
  return sum
end

def sum_to_n? arr, n
  return false if arr.empty? or arr.length == 1
  appear = Hash.new(0)
  arr.each do |element|
    if appear[n-element] == 1 then
      return true
    else 
      appear[element] = 1
    end
  end
  return false
end

# Part 2

def hello(name)
  return "Hello, " + name
  # return "Hello, #{name}"
end

def starts_with_consonant? s
  # YOUR CODE HERE
  # https://ruby-doc.org/core-2.4.0/String.html#method-i-downcase
  s = s.upcase
  # https://ruby-doc.org/core-2.4.0/Regexp.html
  # /^[B-DF-HJ-NP-TV-Z]/
  if ( /^[A-Z&&[^AEIOU]]/  =~ s) then 
    return true
  end
  return false
end

def binary_multiple_of_4? s
  # YOUR CODE HERE
  if ( /^[0]$/ =~ s) then 
    return true
  end #zero is a multiple of every integer.
  if ( /^[01][01]*0{2,}$/  =~ s) then
    return true
  end
  return false
end

# Part 3

class BookInStock
  
  def initialize(isbn, price)
    raise ArgumentError unless (/.+/ =~ isbn && price>0)
    @isbn=isbn
    @price=price
  end
  #https://dev.to/k_penguin_sato/ruby-getters-and-setters-1p30
  def isbn
    @isbn
  end
  def price
    @price
  end
  def isbn=(isbn)
    @isbn = isbn
  end
  def price=(price)
    @price = price
  end
  def price_as_string
    #https://ruby-doc.org/core-2.4.0/String.html#method-i-25
    '$' + "%.2f" % @price
  end
# YOUR CODE HERE

end
