# When done, submit this entire file to the autograder.

# Part 1

array = [5, 7, 4, 9, 1]
def sum(array)   
   array.inject(0) { |a, b| a + b }
end
sum(array)



array = [5, 7, 4, 9, 1]
def max_2_sum(array)   
  array.sort!do
     |firsti, secondi|
      secondi <=> firsti
  end
   array.inject(0) {array[0] + array[1] }
end
max_2_sum(array)



array = [5, 7, 4, 9, 3]
def sum_to_n?(array, n)   
  if array.sample + array.sample == n
      return true
  else
      return 0
  end
end
sum_to_n?(array, 12)



# Part 2

name = gets.chomp
def hello(name)
 puts "Hello, #{name}"
end
hello(name)  



s = gets.chomp
def starts_with_consonant?(s)
    if s =~ /\A(?=[^aeiou])(?=[a-z])/i
        return true
     else
        return false
    end
end
starts_with_consonant?(s)



s = gets.chomp
def binary_multiple_of_4?(s)
    if s.to_i(4)
        return true
    else
        return false
    end
end
binary_multiple_of_4?(s)



# Part 3

class BookInStock
  def initialize(isbn, price) 
    raise ArgumentError, 'ISBN cannot be empty' if isbn.length == 0
    raise ArgumentError, 'invalid ISBN' if !isbn =~ /[^0-9\-]/
    raise ArgumentError, 'Price has to be greater than zero' if price <= 0
    @isbn = isbn
    @price = price
  end
   attr_accessor :isbn
  attr_accessor :price 
  def price_as_string
       return "\$" + sprintf("%.2f" % @price)
        end 
end
