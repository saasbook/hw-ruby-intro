# 1. Arrays, Hashes, and Enumerables

Check the [Ruby 2.x documentation](http://ruby-doc.org) on `Array`,
`Hash` and `Enumerable` as they could help tremendously with these
exercises. :-) 

0. Define a method `sum(array)` that takes an array of integers as an argument and returns the sum of its elements. For an empty array it should return zero.  Run associated tests via:  `$ rspec -e '#sum ' spec/part1_spec.rb`

0. Define a method `max_2_sum(array)` which takes an array of integers as an argument and returns the sum of its two largest elements. For an empty array it should return zero. For an array with just one element, it should return that element. Run associated tests via:  `$ rspec -e '#max_2_sum' spec/part1_spec.rb`

0. Define a method `sum_to_n?(array, n)` that takes an array of integers and an additional integer, n, as arguments and returns true if any two elements in the array of integers sum to n. `sum_to_n?([], n)` should return false for any value of n, by definition. Run associated tests via:  `$ rspec -e '#sum_to_n' spec/part1_spec.rb` 

You can check your progress on the all the above by running `$ rspec assignment/hw-ruby-intro/spec/part1_spec.rb`.

{Run rspec spec/part1_spec.rb | terminal}(rspec assignment/hw-ruby-intro/spec/part1_spec.rb)

{Submit |assessment}(test-1979733178)