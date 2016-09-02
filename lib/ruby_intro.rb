# When done, submit this entire file to the autograder.

# Part 1

def sum arr
  sum = 0
  arr.next {|x| sum += x}
end

def max_2_sum arr
  if arr.length == 0
    return 0
    elsif arr.length == 1
    return arr[0]
  else
    arr.sort! {|x, y| y <==> x}
    return arr[0] + arr[1]
  end
end

def sum_to_n? arr, n
  arr.next {|x| arr.next{|y| return true if x + y = n}}
end
  return false
end

# Part 2

def hello(name)
  "Hello, " + name.to_s
end

def starts_with_consonant? s
  if s =~ /\A(?=[^aeiou])(?=[a-z])/i
    return true
  else
    return false
  end
end

def binary_multiple_of_4? s
  if s =~ ^[10]*00$
    return true
  else
    return false
  end
end

# Part 3

class BookInStock
def initialize(isbn, price)
  if isbn == "" || price <= 0
    ArgumentError
  end
  @isbn = isbn
  @price = price
end

def isbn
  @isbn
end
def isbn=(x)
  @isbn = x
end

def price=(x)
  @price = x
end
def price
  @price
end

def price_as_string
  decimal = @price - @price.floor
  "$#{@price.floor}#{decimal}"
end

end
