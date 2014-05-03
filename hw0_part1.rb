# Define a method sum which takes an array of integers as an argument and returns the sum of its elements. For an empty array it should return zero.

def sum(array)
  return 0 if array.empty?
end

raise 'sum([]) != 0' unless sum([]) == 0
raise 'sum([1, 2, 3]) != 6' unless sum([1, 2, 3]) == 6
