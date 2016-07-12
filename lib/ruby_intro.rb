# When done, submit this entire file to the autograder.

# Part 1

def sum arr
  # YOUR CODE HERE
  if arr.length == 0 then
 return 0
else
total  = 0
arr.each { |a| total+=a }
return total
end
end

def max_2_sum arr
  # YOUR CODE HERE
  case arr.length
    when 0
      return 0
    when 1
      return arr.first
    else
      return (arr.sort!.pop)+(arr.sort!.pop)
  end
end

def sum_to_n? arr, n
  # YOUR CODE HERE
  c_p = arr.product(arr).select! { |c| c[0]+c[1] == val }
  not c_p.empty?
end

# Part 2

def hello(name)
  # YOUR CODE HERE
  return "Hello  "+name
end

def starts_with_consonant? s
  # YOUR CODE HERE
end

def binary_multiple_of_4? s
  # YOUR CODE HERE
end

# Part 3

class BookInStock
# YOUR CODE HERE
end
