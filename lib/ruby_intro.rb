# When done, submit this entire file to the autograder.

# Part 1

def sum arr
  # YOUR CODE HERE
	arr.push(0)
	arr.inject(:+)
end

def max_2_sum arr
  # YOUR CODE HERE
	if arr.empty?
	arr.push(0,0)
	end
	b=arr.max(2)
	b.inject(:+)
end

def sum_to_n? arr, n
  # YOUR CODE HERE
	b=arr.clone
	b.pop(2)
	if b.empty?
	false
	else
	c=[]
	arr.each_with_index{|r,s| arr.each_with_index{|l,m| c<< r+l if s!=m}}
	d=c.count(n)
	if d==0
	false
	else
	true
	end
	
	end
	
end

# Part 2

def hello(name)
	a="Hello, #{name}"
	a
  # YOUR CODE HERE
end

def starts_with_consonant? s
  # YOUR CODE HERE
	if(s.empty?)
	false
	elsif (s[0].ord>65 && s[0].ord<=90) || (s[0].ord>97 && s[0].ord<=122)
		if (s[0].ord==69 || s[0].ord==73 || s[0].ord==79 || s[0].ord==85 || s[0].ord==101 || s[0].ord==105 || s[0].ord==111 || s[0].ord==117)
		false
		else
		true
		end
	else	
	false
	end     
	  
	
end

def binary_multiple_of_4? s
  	if s.count("0")+s.count("1")!=s.size
		false
	elsif (s.size<3 && s!="0")
		false
	elsif (s=="0")
		true
	elsif (s[-1]=="0" && s[-2]=="0")
		true
	else
	false
	end
end

# Part 3

class BookInStock
# YOUR CODE HERE
	def initialize(isbn,price)
	if isbn==nil or isbn.size==0
		raise ArgumentError.new('Invalid ISBN number')
	end
	@isbn=isbn
	if price<=0 
		raise ArgumentError.new('Invalid Book price')
	end
	@price=price
	end
	
	def isbn
	@isbn
	end

	def price
	@price
	end
	
	def isbn=(new_isbn)
	if new_isbn==nil or new_isbn.size==0
		raise ArgumentError.new('Everyone')
	end
	@isbn=new_isbn
	end

	def price=(new_price)
	if new_price<=0 
		raise ArgumentError.new('Invalid Book price')
	end
	@price=new_price
	end
	
	def price_as_string
	sprintf("$%.2f",@price)
	end
end
