# 2. Strings and Regular Expressions

Check the documentation on String and Regexp as they could help tremendously with these exercises. :-)

0. Define a method `hello(name)` that takes a string representing a name and returns the string "Hello, " concatenated with the name. Run associated tests via:  `$ rspec -e '#hello' spec/part2_spec.rb`

0. Define a method `starts_with_consonant?(s)` that takes a string and returns true if it starts with a consonant and false otherwise. (For our purposes, a consonant is any letter other than A, E, I, O, U.) NOTE: be sure it works for both upper and lower case and for nonletters!  Run associated tests via:  `$ rspec -e '#starts_with_consonant?' spec/part2_spec.rb`

0. Define a method `binary_multiple_of_4?(s)` that takes a string and returns true if the string represents a binary number that is a multiple of 4. NOTE: be sure it returns false if the string is not a valid binary number!  Run associated tests via:  `$ rspec -e '#binary_multiple_of_4?' spec/part2_spec.rb`

You can check your progress on the all the above by running `$ rspec assignment/hw-ruby-intro/spec/part2_spec.rb`.

{Run rspec spec/part2_spec.rb | terminal}(rspec assignment/hw-ruby-intro/spec/part2_spec.rb)

{Submit!|assessment}(test-945754669)