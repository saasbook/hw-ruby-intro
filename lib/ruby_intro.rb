# When done, submit this entire file to the autograder.

# Part 1

def sum arr
  arr.sum
end

def max_2_sum arr
  result = 0;
  if arr.empty?
    return 0
    end
    if arr.length == 1
      return arr[0]
      end
      a = arr.max();
      t = arr.index(a)
      arr.delete_at(t)
      b = arr.max();
      result = a + b
      return result
end

def sum_to_n? arr, n
  if arr.empty?
    return false;
    end
    arr.each do |x|
      tmp = arr
      tar = n - x
      tmp.delete(x)
      if tmp.include?(tar)
        return true
      end
    end
    return false
end

# Part 2

def hello(name)
  "Hello, #{name}"
end

def starts_with_consonant? s
  if s.length == 0
    return false
    end
    if ('A'..'Z').include?(s[0].upcase)
      var = ['A','E','I','O','U']
      if var.include?(s[0].upcase)
        return false
        end
        return true
    end
    return false
end

def binary_multiple_of_4? s
  return false unless s =~ /\A[01]+\z/
  s.to_i(2) % 4 == 0
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
    "$%.2f" % price
  end
end