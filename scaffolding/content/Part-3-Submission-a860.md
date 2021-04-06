# 3. Object Oriented Basics


Define a class `BookInStock` which represents a book with an ISBN number, `isbn`, and price of the book as a floating-point number, `price`, as attributes. Run associated tests via:  `$ rspec -e 'getters and setters' spec/part3_spec.rb` 

The constructor should accept the ISBN number (a string, since in real life ISBN numbers can begin with zero and can include hyphens) as the first argument and price as second argument, and should raise `ArgumentError` (one of Ruby's built-in exception types) if the ISBN number is the empty string or if the price is less than or equal to zero.  Include the proper getters and setters for these attributes. Run associated tests via:  `$ rspec -e 'constructor' spec/part3_spec.rb`

Include a method `price_as_string` that returns the price of the book formatted with a leading dollar sign and two decimal places, that is, a price of 20 should format as `$20.00` and a price of 33.8 should format as `$33.80`. Run associated tests via:  `$ rspec -e '#price_as_string' spec/part3_spec.rb`

You can check your progress on the all the above by running `rspec assignment/hw-ruby-intro/spec/part3_spec.rb`.

{Run rspec spec/part3_spec.rb | terminal}(rspec assignment/hw-ruby-intro/spec/part3_spec.rb)

{Submit!|assessment}(test-2550083281)