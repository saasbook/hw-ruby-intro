# When done, submit this entire file to the autograder.

# Part 1

def sum arr
  # YOUR CODE HERE
  arr.inject(0, :+)
end

def max_2_sum arr
  # YOUR CODE HERE
    return 0 if arr.length == 0 
      
    return arr[0] if arr.length == 1 
  
    sorted = arr.sort
    return sorted[-1]+sorted[-2]
end

def sum_to_n? arr, n
  # YOUR CODE HERE
  return false if arr.length == 0 or arr.length == 1
  
  hash = Hash.new
  arr.each do |item|
    if hash.key? n-item
      return true
    else
      hash[item] = item
    end
  end
  return false
end

# Part 2

def hello(name)
  # YOUR CODE HERE
  s = "Hello, ";
  return s + name
end


def starts_with_consonant? s
  # YOUR CODE HERE
  if s.length == 0
    return false
  end
  
  #Reference: https://stackoverflow.com/questions/10637606/doesnt-ruby-have-isalpha
  if s.match(/^[[:alpha:]]+$/) == nil
    return false
  end
  
  low = s.downcase;
  
  if low.start_with?('a','e','i','o','u')
    return false
  end
  
  return true
end

#Reference: https://stackoverflow.com/questions/39743299/check-if-a-string-contains-only-digits-in-ruby
def check_string(string)
  string.scan(/\D/).empty?
end

def binary_multiple_of_4? s
  # YOUR CODE HERE
  if s.length == 0 
    return false;
  end
  
  if check_string(s)  == false
    return false;
  end
  
  num = s.to_i;
  if(num%4 == 0)
    return true;
  end;
  
  return false;
  
end

# Part 3

class BookInStock
# YOUR CODE HERE
  attr_reader :isbn, :price 
  attr_writer :isbn, :price 

  def initialize(isbn, price)
    raise ArgumentError if isbn.length <= 0;
    raise ArgumentError if price <= 0;
    
    @isbn = isbn
    @price = price
  end
 
  def price_as_string
    s_price = price.to_s;
    if s_price.count('.') == 0
      s_price = s_price + ".00";
    end
    
    if s_price[s_price.length - 2] == '.'
      s_price = s_price + "0";
    end
    
    return "$" + s_price;
  end
end