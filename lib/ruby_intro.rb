# When done, submit this entire file to the autograder.

# Part 1

def sum arr
  return 0 if arr.empty?
  result = 0
  arr.each do |elem|
  	result += elem
  end	
  return result
end

def max_2_sum arr
  return 0 if arr.empty?
  max = arr.max(2)
  result = 0
  max.each do |i|
  	result += i
  end
  result
end

def sum_to_n? arr, n
  return false if arr.empty?
	arr.combination(2).any? {|a, b| a + b == n }
end

# Part 2

def hello(name)
	"Hello, #{name}"
end

def starts_with_consonant? s
	return false if s.empty?
	/^[b-df-hj-np-tv-z]/i.match(s) != nil
end

def binary_multiple_of_4? s
	return true if s == "0"
	/^[10]*00$/.match(s) != nil
end

# Part 3

class BookInStock
	attr_accessor :price
	attr_accessor :isbn
	def initialize(isbn,price)
		raise ArgumentError, 
			"Illegal argument" if isbn.empty?  or price <= 0
		@price = price
		@isbn = isbn
	end
	def price_as_string
		sprintf("$%2.2f", @price)
	end
end

#arr = [1,4,5,6]
#puts sum(arr)

#puts max_2_sum(arr)

#puts arr.combination(2).to_a
#puts starts_with_consonant?("abaradadfds")