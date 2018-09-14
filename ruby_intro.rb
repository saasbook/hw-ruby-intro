# When done, submit this entire file to the autograder.

# Part 1

def sum arr
	sum = 0
	arr.inject(0){|sum,x| sum + x }
end

def max_2_sum arr
	# YOUR CODE HERE
	max_1=nil
	max_2=nil
	arr.each do |element|
		if max_1.nil?
			max_1=element
		elsif max_2.nil?
			max_2=element
		elsif element>max_1
			max_1=element
		elsif element>max_2
			max_2=element
		end
	end
	if max_1.nil?
		max_1=0
	end
	if max_2.nil?
		max_2=0
	end
	max_1+max_2
end

def sum_to_n? arr, n
	require 'set'
	seen_values=Set[]
	arr.each do |element|
		to_look_for=n-element
		if seen_values.include? to_look_for
			return true
		end
		seen_values.add(element)
	end
	return false
end

# Part 2

def hello(name)
	return 'Hello, '+name
end

def starts_with_consonant? s
	return ((not /[^a-zA-Z\d\s:]/.match?(s)) && (not s.to_s.strip.empty?) && (not (/^[a|e|i|o|u]/.match?(s.downcase))))
end

def binary_multiple_of_4? s
	return /^0$/.match(s) || (/^[(0|1)]+$/.match(s) && /00$/.match(s))
end

# Part 3

class BookInStock
	@isbn=0
	@price=0.0
	
	def _isbn_verifier(isbn)
		raise ArgumentError, 'ISBN input is empty!' unless (not isbn.to_s.strip.empty?)
	end	

	def _price_verifier(price)
		raise ArgumentError, 'Price cannot be negative!' unless (price.to_f>0)
	end

	def initialize(isbn, price)
		_isbn_verifier(isbn)
		_price_verifier(price)

		@isbn=isbn
		@price=price.to_f
    	end
	
	def isbn=(isbn)
		_isbn_verifier(isbn)
		@isbn=isbn
	end

	def isbn()
		return @isbn
	end

	def price=(price)
		_price_verifier(price)
		@price=price.to_f
	end

	def price()
		return @price
	end

	def price_as_string()
		return ('$%.2f' % @price)
	end
end
