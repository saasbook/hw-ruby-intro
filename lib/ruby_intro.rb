# When done, submit this entire file to the autograder.

# Part 1

def sum arr
  # YOUR CODE HERE
  arr.inject(0,:+)
end

def max_2_sum arr
  # YOUR CODE HERE
  empty = 0
  arr = arr.sort
  if arr == []
  	return empty
  elsif arr.length == 1
  	return arr[0]
  else
	  m_sum = (arr[-1]) + (arr[-2])
	  return m_sum
  end
end

def sum_to_n? arr, n
  # YOUR CODE HERE
  if arr.length == 0 || arr.length == 1
  	return false
  else
  	arr.combination(2).any? {|a, b| a + b == n }
  end 
end

# Part 2

def hello(name)
  # YOUR CODE HERE
  name = name.to_s
  helloname = "Hello, " + name
  return helloname
end

def starts_with_consonant? (s)
  # YOUR CODE HERE
  if s[0].class.name == "String"
		s[0] = s[0].downcase 
		if ( /[a-z]/ =~ s[0] && /[^aeiou]/ =~ s[0])
			return true
		else
			return false
		end
	elsif s.empty?
		return false
	else
		return false
	end
  
end

def binary_multiple_of_4? (s)
  # YOUR CODE HERE
  	if (s =~ /^[0-1]+$/) && (s.to_i % 4 == 0)
		return true
	else
		return false
	end
end

# Part 3

class BookInStock
# YOUR CODE HERE
attr_accessor :isbn, :price
	def initialize (isbn, price)
		raise ArgumentError if isbn.empty? || price <= 0
		@isbn = isbn
		@price = price
	end

	def price_as_string
		"$%.2f" % @price
	end
end
