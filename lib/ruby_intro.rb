# When done, submit this entire file to the autograder.

# Part 1

def sum arr
  # YOUR CODE HERE
  sum = 0
  #Iterate through the array and add elements
  arr.each do |i|
     sum = sum+i
  end
  return sum
end

def max_2_sum arr
  # YOUR CODE HERE
  # If length is 1 return the element
  if arr.length == 1
    return arr[0]
  # If length is 0 return 0
  elsif arr.length == 0
    return 0
  end
  
  #remember the 2 max values with max1 and max2 (max2 >= max1)
  #intitalize max1 and max2 with first two elements of the array
  max1 = arr[0] >= arr[1]?arr[1]:arr[0]
  max2 = arr[0] >= arr[1]?arr[0]:arr[1]
  #iterate through the array and update max1 and max2 values
  for i in 2..arr.length-1
    if arr[i] >= max2
	    max1 = max2
	    max2 = arr[i]
    elsif arr[i]>max1
	    max1 = arr[i]
    end
  end
  max = max1+max2
  return max #return the sum of max1+max2
end

def sum_to_n? arr, n
  # YOUR CODE HERE
  # use hash table to store the array values
  hm = Hash.new
  
  #For each element i in the array search the hash table for [n-i], if not found
  #add the elemnt to the hash table
  arr.each do |i|
    if hm[n-i] != nil
      return true
    else 
      hm.store(i, i)
    end 
  end 
  return false
end

# Part 2

def hello(name)
  # YOUR CODE HERE
  str = "Hello, "
  #append name to str and return
  return str+name
end

def starts_with_consonant? s
  # Capitalize the first letter of string
  s = s.capitalize
  # If length is 0 return false
  if s.length == 0
    return false
  end 
  
  # If starting letter is not a alphabet return false
  if s[0] < "A" || s[0] > "Z"
    return false
  end 
  # Store the Vowels in hashmap
  hmap = Hash["A"=>1,"E"=>1, "I"=>1, "O"=>1, "U"=>1]
  # Do hash lookup with first character if hit then it's a vowel so return false
  if(hmap[s[0]] != nil)
    return false
  end
  return true
end

def binary_multiple_of_4? s
  # If length 0 return false
  if s.length == 0 
    return false
  end 
  
  # Iterate through the string to check invalid characters
  for i in 0..(s.length-1)
    if s[i] != '0' && s[i] != '1'
      return false
    end 
  end
  
  #The 2 LSB bits of a number should be 00 to be multiple of 4
  l0 = s[s.length-1]
  l1 = s[s.length-2];
  
  if l1 == '0' && l0 == '0'
    return true
  end 
  return false
end

# Part 3

class BookInStock
# YOUR CODE HERE
  def initialize(isbn, price)
    #check if isbn number is valid
    if isbn.length == 0
      raise ArgumentError.new("Invalid ISBN number")
    end
    #check if price is valid
    if price <= 0
      raise ArgumentError.new("Invalid price")
    end
    @isbn, @price = isbn, price
  end
  
  #getter for ISBN 
  def isbn
    @isbn
  end 
  
  #getter for price
  def price
    @price
  end 
  
  #setter for isbn
  def isbn=(value)
    if value.length == 0
      raise ArgumentError.new("Invalid ISBN number")
    end
    @isbn = value
    @isbn
  end 
  
  #setter for price
  def price=(value)
    if value <= 0
      raise ArgumentError.new("Invalid price")
    end
    @price = value
    @price
  end 
  
  #Return price as string
  def price_as_string
    #take integer part of the number
    iprice = @price.to_i
    #take decimal part of the number
    fprice = @price-iprice.to_f
    #Multiply the fraction with 100 and convert to integer to take 2 decimal points
    fprice = fprice*100
    ifprice = fprice.to_i
    if ifprice < 10
      str = "$"+iprice.to_s+".0"+ifprice.to_s
    else 
      str = "$"+iprice.to_s+"."+ifprice.to_s
    end 
    return str
  end 
end
