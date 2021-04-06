# Ruby intro part 1 solutions

# Returns the sum of all the numbers in `collection`, which must be 
# enumerable
def sum(collection)
  collection.inject(0) do |total, n|
    total + n
  end
end

# Return the sum of the 2 largest elements in a collection
def max_2_sum(collection)
  case collection.size
  when 0
    0
  when 1
    collection[0]
  when 2
    collection[0] + collection[1]
  else
    biggest = collection.max
    collection.delete_at(collection.index biggest)
    biggest + collection.max
  end
end

# Return true iff exactly 2 elements of collection sum to the given number
# Uses the handy `permutation` instance method of `Array`.
def sum_to_n?(collection, total)
  return false if collection.empty?
  return false if collection.length == 1
  collection.permutation(2).any? { |pair| pair[0] + pair[1] == total }
end

