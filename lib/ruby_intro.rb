# When done, submit this entire file to the autograder.

# Part 1

# (1)--------------------------------------------------------

def sum(array)
  sum = 0
  result = 0
  if array.length > 0 then
    array.each do |x|
      sum += x
    end
    result = sum.to_i
  end
  return result
end

# (2)--------------------------------------------------------

def max_2_sum(array)
  if array.empty?
    return 0
  end

   if array.length == 1
     return array.first
   end

  array.sort{ |x, y| y <=> x }.take(2).reduce(:+)
end

# (3)------------------------------------------------------------

def sum_to_n? arr, n
  if arr.empty?
    if n == 0
      return false
    end
  else
    arr.combination(2).to_a.each do |x|
      if sum(x) == n
        return true
      end
    end
  end
  return false
end

# Part 2----------------------------------------------------------

def hello (name)
  "Hello, " + name
end

# (2)---------------------------------------------------------------

  def starts_with_consonant? s
    reg_1=/[a-z]/
      reg_2=/[^aeiou]/
    if(reg_1===s[0].to_s.downcase && reg_2===s[0].to_s.downcase)
      return true
    else
      return false
    end
  end

  # (3)---------------------------------------------------------------

def binary_multiple_of_4? s
  reg=/[^01]/
  if(reg===s)
    return false
  elsif(s.to_i.to_s(10).to_i%4==0)
    return true
  else
    return false
  end
end

# Part 3---------------------------------------------------

class BookInStock

  attr_accessor :isbn, :price

  def initialize isbn, price
    raise ArgumentError if isbn.empty? || price <= 0
    @isbn = isbn
    @price = price
  end

  def price_as_string
    format("$%.2f", @price)
  end

end






