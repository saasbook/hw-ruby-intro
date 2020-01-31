# When done, submit this entire file to the autograder.

# Part 1

def sum(arr)
  if arr.empty?
		return 0
	else
		return arr.inject(:+)
	end
end

def max_2_sum(arr)
  if arr.empty?
		return 0
	else
		return arr.sort.last(2).inject(:+)
	end
end

def sum_to_n?(arr, n)
  return false if arr.empty? 
  arr.combination(2).any? {|a, b| a + b == n }
end

# Part 2

def hello(name)
  x = "Hello, " + name
  return x
end

def starts_with_consonant? (s)
  !!(s[0] =~ /[bcdfghjklmnprstvwxyz]+/i)
end

def binary_multiple_of_4? (s)
  if (s.to_s =~ /\b[01]+\b/ && s.to_i % 4 == 0)
		return true
	else
		return false
	end
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
    format("$%.2f", @price)
  end
end

# array = [1,2,3,4]
# puts sum(array)
# # returns 10

# array = [1,2,3,4]
# puts max_2_sum(array)
# # returns 7

# array = [1,2]
# puts sum_to_n?(array,4)
# # returns false

# array = [1,2,3]
# puts sum_to_n?(array,4)
# # returns true

# array = []
# puts sum_to_n?(array,4)
# # returns false

# puts hello("Ivan")

# puts starts_with_consonant?("Howdy")
# puts starts_with_consonant?("ivan")
# puts starts_with_consonant?("1234")


