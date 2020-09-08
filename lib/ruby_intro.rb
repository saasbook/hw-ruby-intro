# When done, submit this entire file to the autograder.

# Part 1

def sum arr
  # YOUR CODE HERE
  
  return arr.sum # Other methods: inject, each then add, reduce
  
end

def max_2_sum arr
  # YOUR CODE HERE
  return 0 if arr.empty? 
  a = arr.sort  #while arr.sort descending order, sort.arr { |x,y| y <=> x } sorts in ascending order  
  b = a.last(2).sum #take last two and sum
  return b
end

def sum_to_n? arr, n
  # YOUR CODE HERE
  return false if arr.empty?
  arr.combination(2).any? {|a, b| a + b == n } #returns true/flase 
  
end

# Part 2

def hello(name)
  # YOUR CODE HERE
  return 'Hello' +", "+ name
end

def starts_with_consonant? s

  # YOUR CODE HERE
    return false if s.empty?
    return false if s =~ /\A[aeiou]/i #regular experession (regex) used via Rubular.com: \A: Start string /i:case sensitive [aeiou]: that has those letters
    return true if  s =~ /\A[a-z]/i #regex that includes all letters
    return false

end

def binary_multiple_of_4? s
  
  # YOUR CODE HERE
  
  return true if s == "0"
  int = s.to_i #from binary to integer
  if int % 4 == 0 and int != 0 #if the integer is 4 multiplyer and not 0
    return true
  else
    return false
  end
 
end

# Part 3

class BookInStock
# YOUR CODE HERE
attr_accessor :isbn, :price
  def initialize(isbn, price)
      raise ArgumentError if isbn.empty?
      raise ArgumentError if price.to_i <= 0
      @isbn = isbn
      @price = Float(price)
  end
  def price=(new_price)
    @price=new_price
  end
  def price_as_string
    return '$' + sprintf('%.2f', @price)
  end
end


#test functions  
# puts sum([1,2,3])
#puts max_2_sum([4,1,2,4])
#puts sum_to_n?([0,6,4], 10)
#puts hello('OK')
#puts starts_with_consonant?("fgh")
puts binary_multiple_of_4?("10010100")
# # x = '100100100'.to_i(2)
# # puts (x)
