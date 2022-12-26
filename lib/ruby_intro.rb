# When done, submit this entire file to the autograder.

# Part 1

def sum arr
  arr.sum# Return the sum of all elements in the array
end


def max_2_sum arr# Define a function that takes an array as an argument
  # Initialize a result variable
  result = 0;
  # Check if the array is empty
  if arr.empty?
    # If the array is empty, return 0
    return 0
  end
  # Check if the array has only one element
  if arr.length == 1
    # If the array has only one element, return that element
    return arr[0]
  end
  # Find the maximum element in the array
  a = arr.max();
  # Find the index of the maximum element in the array
  t = arr.index(a)
  # Remove the maximum element from the array
  arr.delete_at(t)
  # Find the second maximum element in the modified array
  b = arr.max();
  # Calculate the sum of the two maximum elements
  result = a + b
  # Return the result
  return result
end


def sum_to_n? arr, n# Define a function that takes an array and a number as arguments
  # Check if the array is empty
  if arr.empty?
    # If the array is empty, return false
    return false;
  end
  # Iterate through each element in the array
  arr.each do |x|
    # Create a copy of the array and remove the current element from the copy
    tmp = arr
    tmp.delete(x)
    # Calculate the target value as n minus the current element
    tar = n - x
    # Check if the target value is in the modified array
    if tmp.include?(tar)
      # If the target value is found, return true
      return true
    end
  end
  # If no two elements sum to the target value, return false
  return false
end

# Part 2


def hello(name)# Define a function that takes a name as an argument
  # Return a greeting message using string interpolation
  "Hello, #{name}"
end


def starts_with_consonant? s# Define a function that takes a string as an argument
  # Check if the string is empty
  if s.length == 0
    # If the string is empty, return false
    return false
  end
  # Check if the first character is a letter
  if ('A'..'Z').include?(s[0].upcase)
    # If the first character is a letter, check if it is a vowel
    var = ['A','E','I','O','U']
    if var.include?(s[0].upcase)
      # If the first character is a vowel, return false
      return false
    end
    # If the first character is a consonant, return true
    return true
  end
  # If the first character is not a letter, return false
  return false
end


def binary_multiple_of_4? s# Define a function that takes a string as an argument
  # Check if the string consists only of 0s and 1s
  return false unless s =~ /\A[01]+\z/
  # Convert the string to an integer in base 2 (binary)
  # and check if it is a multiple of 4
  s.to_i(2) % 4 == 0
end

# Part 3


class BookInStock# Define a class for a book with an ISBN and a price
  # Define attribute accessor methods for the ISBN and price
  attr_accessor :isbn, :price
  # Define a constructor method that takes an ISBN and price as arguments
  def initialize(isbn, price)
    # Raise an ArgumentError if the ISBN is an empty string or the price is less than or equal to 0
    raise ArgumentError if isbn.empty? || price <= 0

    # Set the values of the instance variables
    @isbn = isbn
    @price = price
  end
  # Define a method that returns the price as a string in the form "$X.XX"
  def price_as_string
    "$%.2f" % price
  end
end