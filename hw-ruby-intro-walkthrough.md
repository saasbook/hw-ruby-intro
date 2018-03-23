Note that these are opinionated walkthroughs from Sam Joseph.  Opinions expressed are those of Sam Joseph alone and do not necessarily reflect the opinions of UCBerkeley or any of its employees.

NOTE: can we get the green/red rspec highlighting in markdown somehow?

Follow instructions in https://github.com/saasbook/hw-ruby-intro README

### Section 1: Arrays, Hashes, and Enumerables


We recommend starting by running the following individual test:

```
$ rspec spec/part1_spec.rb:5
```

which should give the following output:

```
Run options: include {:locations=>{"./spec/part1_spec.rb"=>[5]}}

Ruby intro part 1
  #sum
    should be defined
    returns correct sum [20 points] (FAILED - 1)
    works on the empty array [10 points] (FAILED - 2)

Failures:

  1) Ruby intro part 1 #sum returns correct sum [20 points]
     Failure/Error: expect(sum([1,2,3,4,5])).to be_a_kind_of Fixnum
       expected nil to be a kind of Fixnum
     # ./spec/part1_spec.rb:11:in `block (3 levels) in <top (required)>'

  2) Ruby intro part 1 #sum works on the empty array [10 points]
     Failure/Error: expect(sum([])).to be_zero
       expected nil to respond to `zero?`
     # ./spec/part1_spec.rb:19:in `block (3 levels) in <top (required)>'

Finished in 0.01412 seconds (files took 0.08426 seconds to load)
3 examples, 2 failures

Failed examples:

rspec ./spec/part1_spec.rb:10 # Ruby intro part 1 #sum returns correct sum [20 points]
rspec ./spec/part1_spec.rb:17 # Ruby intro part 1 #sum works on the empty array [10 points]
```

Then open the relevant file in an editor, i.e. `lib/ruby_intro.rb` and try to make the tests pass.  For example the following code will pass some tests but not others:

```rb
def sum arr
  arr.inject :+
end
```

gives the following:

```
→ rspec spec/part1_spec.rb:5
Run options: include {:locations=>{"./spec/part1_spec.rb"=>[5]}}

Ruby intro part 1
  #sum
    should be defined
    returns correct sum [20 points]
    works on the empty array [10 points] (FAILED - 1)

Failures:

  1) Ruby intro part 1 #sum works on the empty array [10 points]
     Failure/Error: expect(sum([])).to be_zero
       expected nil to respond to `zero?`
     # ./spec/part1_spec.rb:19:in `block (3 levels) in <top (required)>'

Finished in 0.01663 seconds (files took 0.08987 seconds to load)
3 examples, 1 failure

Failed examples:

rspec ./spec/part1_spec.rb:17 # Ruby intro part 1 #sum works on the empty array [10 points]
```

however the following should pass all the tests:

```rb
def sum arr
  arr.inject 0, :+
end
```

```
→ rspec spec/part1_spec.rb:5
Run options: include {:locations=>{"./spec/part1_spec.rb"=>[5]}}

Ruby intro part 1
  #sum
    should be defined
    returns correct sum [20 points]
    works on the empty array [10 points]

Finished in 0.0034 seconds (files took 0.08725 seconds to load)
3 examples, 0 failures
```

There are of course many different versions of the code that will pass all the tests, including hard coding the individual inputs to outputs specified in the test itself.  It is impractical to have tests that rigorously test a function without resorting to random inputs that then impact the ability of our tests to be deterministically repeatable.  As in this case we usually satisfy ourselves with tests for a range of boundary cases.

Having successfully passed the tests for this first method, we can move on to the next method:

```
rspec spec/part1_spec.rb:23
```

which should fail as follows:

```
Run options: include {:locations=>{"./spec/part1_spec.rb"=>[23]}}

Ruby intro part 1
  #max_2_sum
    should be defined
    returns the correct sum [7 points] (FAILED - 1)
    works even if 2 largest values are the same [3 points] (FAILED - 2)
    returns zero if array is empty [10 points] (FAILED - 3)
    returns value of the element if just one element [10 points] (FAILED - 4)

Failures:

  1) Ruby intro part 1 #max_2_sum returns the correct sum [7 points]
     Failure/Error: expect(max_2_sum([1,2,3,4,5])).to be_a_kind_of Fixnum
       expected nil to be a kind of Fixnum
     # ./spec/part1_spec.rb:28:in `block (3 levels) in <top (required)>'

  2) Ruby intro part 1 #max_2_sum works even if 2 largest values are the same [3 points]
     Failure/Error: expect(max_2_sum([1,2,3,3])).to eq(6)
     
       expected: 6
            got: nil
     
       (compared using ==)
     # ./spec/part1_spec.rb:32:in `block (3 levels) in <top (required)>'

  3) Ruby intro part 1 #max_2_sum returns zero if array is empty [10 points]
     Failure/Error: expect(max_2_sum([])).to be_zero
       expected nil to respond to `zero?`
     # ./spec/part1_spec.rb:35:in `block (3 levels) in <top (required)>'

  4) Ruby intro part 1 #max_2_sum returns value of the element if just one element [10 points]
     Failure/Error: expect(max_2_sum([3])).to eq(3)
     
       expected: 3
            got: nil
     
       (compared using ==)
     # ./spec/part1_spec.rb:38:in `block (3 levels) in <top (required)>'

Finished in 0.02056 seconds (files took 0.12443 seconds to load)
5 examples, 4 failures

Failed examples:

rspec ./spec/part1_spec.rb:27 # Ruby intro part 1 #max_2_sum returns the correct sum [7 points]
rspec ./spec/part1_spec.rb:31 # Ruby intro part 1 #max_2_sum works even if 2 largest values are the same [3 points]
rspec ./spec/part1_spec.rb:34 # Ruby intro part 1 #max_2_sum returns zero if array is empty [10 points]
rspec ./spec/part1_spec.rb:37 # Ruby intro part 1 #max_2_sum returns value of the element if just one element [10 points]
```

In this case we could start by handling some boundary or corner cases, e.g.

```rb
def max_2_sum arr
  return 0 if arr.empty?
  return arr.first if arr.length == 1
end
```

which results in some of the tests passing:

```
Run options: include {:locations=>{"./spec/part1_spec.rb"=>[23]}}

Ruby intro part 1
  #max_2_sum
    should be defined
    returns the correct sum [7 points] (FAILED - 1)
    works even if 2 largest values are the same [3 points] (FAILED - 2)
    returns zero if array is empty [10 points]
    returns value of the element if just one element [10 points]

Failures:

  1) Ruby intro part 1 #max_2_sum returns the correct sum [7 points]
     Failure/Error: expect(max_2_sum([1,2,3,4,5])).to be_a_kind_of Fixnum
       expected nil to be a kind of Fixnum
     # ./spec/part1_spec.rb:28:in `block (3 levels) in <top (required)>'

  2) Ruby intro part 1 #max_2_sum works even if 2 largest values are the same [3 points]
     Failure/Error: expect(max_2_sum([1,2,3,3])).to eq(6)
     
       expected: 6
            got: nil
     
       (compared using ==)
     # ./spec/part1_spec.rb:32:in `block (3 levels) in <top (required)>'

Finished in 0.01687 seconds (files took 0.10707 seconds to load)
5 examples, 2 failures

Failed examples:

rspec ./spec/part1_spec.rb:27 # Ruby intro part 1 #max_2_sum returns the correct sum [7 points]
rspec ./spec/part1_spec.rb:31 # Ruby intro part 1 #max_2_sum works even if 2 largest values are the same [3 points]
```

The following code will pass all the tests:

```rb
def max_2_sum arr
  return 0 if arr.empty?
  return arr.first if arr.length == 1
  sum(arr.sort.reverse[0..1])
end
```

```
→ rspec spec/part1_spec.rb:23
Run options: include {:locations=>{"./spec/part1_spec.rb"=>[23]}}

Ruby intro part 1
  #max_2_sum
    should be defined
    returns the correct sum [7 points]
    works even if 2 largest values are the same [3 points]
    returns zero if array is empty [10 points]
    returns value of the element if just one element [10 points]

Finished in 0.00354 seconds (files took 0.09539 seconds to load)
5 examples, 0 failures
```

Thus we can move on to the third part of section 1:

```
$ rspec spec/part1_spec.rb:42

Run options: include {:locations=>{"./spec/part1_spec.rb"=>[42]}}

Ruby intro part 1
  #sum_to_n
    should be defined
    returns true when any two elements sum to the second argument [30 points] (FAILED - 1)
    returns false for any single element array [5 points] (FAILED - 2)
    returns false for an empty array [5 points] (FAILED - 3)

Failures:

  1) Ruby intro part 1 #sum_to_n returns true when any two elements sum to the second argument [30 points]
     Failure/Error: expect(sum_to_n?([1,2,3,4,5], 5)).to be true        # 2 + 3 = 5
     
       expected true
            got nil
     # ./spec/part1_spec.rb:47:in `block (3 levels) in <top (required)>'

  2) Ruby intro part 1 #sum_to_n returns false for any single element array [5 points]
     Failure/Error: expect(sum_to_n?([0], 0)).to be false
     
       expected false
            got nil
     # ./spec/part1_spec.rb:63:in `block (3 levels) in <top (required)>'

  3) Ruby intro part 1 #sum_to_n returns false for an empty array [5 points]
     Failure/Error: expect(sum_to_n?([], 0)).to be false
     
       expected false
            got nil
     # ./spec/part1_spec.rb:69:in `block (3 levels) in <top (required)>'

Finished in 0.01879 seconds (files took 0.12506 seconds to load)
4 examples, 3 failures

Failed examples:

rspec ./spec/part1_spec.rb:46 # Ruby intro part 1 #sum_to_n returns true when any two elements sum to the second argument [30 points]
rspec ./spec/part1_spec.rb:62 # Ruby intro part 1 #sum_to_n returns false for any single element array [5 points]
rspec ./spec/part1_spec.rb:68 # Ruby intro part 1 #sum_to_n returns false for an empty array [5 points]
```

which we can solve as follows:

```rb
def sum_to_n? arr, n
  arr.combination(2).any?{|a,b| a+b == n}
end
```

```
→ rspec spec/part1_spec.rb:42
Run options: include {:locations=>{"./spec/part1_spec.rb"=>[42]}}

Ruby intro part 1
  #sum_to_n
    should be defined
    returns true when any two elements sum to the second argument [30 points]
    returns false for any single element array [5 points]
    returns false for an empty array [5 points]

Finished in 0.00287 seconds (files took 0.12591 seconds to load)
4 examples, 0 failures
```

And we have completed section 1.  

### Section 2: Strings and Regular Expressions

To show a different way to select tests for execution, let's run these tests by their name rather than their line number, e.g. 

```
$ rspec -e '#hello' spec/part2_spec.rb
```

```
Run options: include {:full_description=>/\#hello/}

#hello
  should be defined
  The hello method returns the correct string [30 points] (FAILED - 1)

Failures:

  1) #hello The hello method returns the correct string [30 points]
     Failure/Error: expect(hello("Dan").class).to eq(String)
     
       expected: String
            got: NilClass
     
       (compared using ==)
     
       Diff:
       @@ -1,2 +1,2 @@
       -String
       +NilClass
       
     # ./spec/part2_spec.rb:9:in `block (2 levels) in <top (required)>'

Finished in 0.01753 seconds (files took 0.12628 seconds to load)
2 examples, 1 failure

Failed examples:

rspec ./spec/part2_spec.rb:8 # #hello The hello method returns the correct string [30 points]
```

The following code is sufficient to pass this test:

```rb
def hello(name)
  "Hello, #{name}"
end
```

```
→ rspec -e '#hello' spec/part2_spec.rb
Run options: include {:full_description=>/\#hello/}

#hello
  should be defined
  The hello method returns the correct string [30 points]

Finished in 0.00278 seconds (files took 0.11754 seconds to load)
2 examples, 0 failures
```

Moving on to the next test, we see that some test cases pass off the bat:

```
rspec -e '#starts_with_consonant?' spec/part2_spec.rb
```

```
Run options: include {:full_description=>/\#starts_with_consonant\?/}

#starts_with_consonant?
  should be defined
  classifies true cases [10 points] (FAILED - 1)
  classifies false cases [10 points]
  works on the empty string [5 points]
  works on nonletters [5 points]

Failures:

  1) #starts_with_consonant? classifies true cases [10 points]
     Failure/Error: expect(starts_with_consonant?('v')).to be_truthy, "'v' is a consonant"
       'v' is a consonant
     # ./spec/part2_spec.rb:21:in `block (2 levels) in <top (required)>'

Finished in 0.02003 seconds (files took 0.08548 seconds to load)
5 examples, 1 failure

Failed examples:

rspec ./spec/part2_spec.rb:20 # #starts_with_consonant? classifies true cases [10 points]
```

since this method is returning a nil, which ruby evaluates as falsy.  These tests could be made more precise by checking specifically for true or false return values as described in the written specification.

However we can pass all the tests with the following code:

```rb
CONSONANTS = ['b','c','d','f','g','h','j','k','l','m','n','p','q','r','s','t','v','x','y','z']

def starts_with_consonant? s
  CONSONANTS.include? s.downcase.chars.first
end
```

and move on to the third problem which we can run as follows:

```
$ rspec -e '#binary_multiple_of_4?' spec/part2_spec.rb
```


```
Run options: include {:full_description=>/\#binary_multiple_of_4\?/}

#binary_multiple_of_4?
  should be defined
  classifies valid binary numbers [30 points] (FAILED - 1)
  rejects invalid binary numbers [10 points]

Failures:

  1) #binary_multiple_of_4? classifies valid binary numbers [30 points]
     Failure/Error: expect(binary_multiple_of_4?(string)).to be_truthy,  "Incorrect results for input: \"#{string}\""
       Incorrect results for input: "1010101010100"
     # ./spec/part2_spec.rb:46:in `block (3 levels) in <top (required)>'
     # ./spec/part2_spec.rb:45:in `each'
     # ./spec/part2_spec.rb:45:in `block (2 levels) in <top (required)>'

Finished in 0.01821 seconds (files took 0.12726 seconds to load)
3 examples, 1 failure

Failed examples:

rspec ./spec/part2_spec.rb:44 # #binary_multiple_of_4? classifies valid binary numbers [30 points]
```

These tests, as some others have done previously, loop through a series of test inputs in one test obscuring the fact that some of the test inputs are actually passing.  That can be confusing unless you look at the tests and see how they are operating.  In any case we can pass all the tests with the following code:

```rb
def binary_multiple_of_4? s
  return false unless contains_only_ones_and_zeros? s
  return true if s == '0' 
  s[-3..-1] == '100'
end

def contains_only_ones_and_zeros? s
  s.gsub(/1|0/, '').length == 0
end
```

Notice the use of the self-documenting method `contains_only_ones_and_zeros` to explain what would otherwise be a slightly convoluted guard case to check for correct formatted binary numbers.
  And with that we have completed section two.

### Section 3: Object Oriented Basics

We can run the tests for the first part of this last section like so:

```
$ rspec -e 'getters and setters' spec/part3_spec.rb
```

```
Run options: include {:full_description=>/getters\ and\ setters/}

BookInStock
  getters and setters
    should set ISBN [10 points] (FAILED - 1)
    should set price [10 points] (FAILED - 2)
    should be able to change ISBN [10 points] (FAILED - 3)
    should be able to change price [10 points] (FAILED - 4)

Failures:

  1) BookInStock getters and setters should set ISBN [10 points]
     Failure/Error: before(:each)  { @book = BookInStock.new('isbn1', 33.8) }
     
     ArgumentError:
       wrong number of arguments (given 2, expected 0)
     # ./spec/part3_spec.rb:9:in `initialize'
     # ./spec/part3_spec.rb:9:in `new'
     # ./spec/part3_spec.rb:9:in `block (3 levels) in <top (required)>'

  2) BookInStock getters and setters should set price [10 points]
     Failure/Error: before(:each)  { @book = BookInStock.new('isbn1', 33.8) }
     
     ArgumentError:
       wrong number of arguments (given 2, expected 0)
     # ./spec/part3_spec.rb:9:in `initialize'
     # ./spec/part3_spec.rb:9:in `new'
     # ./spec/part3_spec.rb:9:in `block (3 levels) in <top (required)>'

  3) BookInStock getters and setters should be able to change ISBN [10 points]
     Failure/Error: before(:each)  { @book = BookInStock.new('isbn1', 33.8) }
     
     ArgumentError:
       wrong number of arguments (given 2, expected 0)
     # ./spec/part3_spec.rb:9:in `initialize'
     # ./spec/part3_spec.rb:9:in `new'
     # ./spec/part3_spec.rb:9:in `block (3 levels) in <top (required)>'

  4) BookInStock getters and setters should be able to change price [10 points]
     Failure/Error: before(:each)  { @book = BookInStock.new('isbn1', 33.8) }
     
     ArgumentError:
       wrong number of arguments (given 2, expected 0)
     # ./spec/part3_spec.rb:9:in `initialize'
     # ./spec/part3_spec.rb:9:in `new'
     # ./spec/part3_spec.rb:9:in `block (3 levels) in <top (required)>'

Finished in 0.00115 seconds (files took 0.08658 seconds to load)
4 examples, 4 failures

Failed examples:

rspec ./spec/part3_spec.rb:10 # BookInStock getters and setters should set ISBN [10 points]
rspec ./spec/part3_spec.rb:13 # BookInStock getters and setters should set price [10 points]
rspec ./spec/part3_spec.rb:16 # BookInStock getters and setters should be able to change ISBN [10 points]
rspec ./spec/part3_spec.rb:20 # BookInStock getters and setters should be able to change price [10 points]
```

Ironically we must implement a constructor for the `getters and setters` tests to pass:

```rb
class BookInStock
  attr_accessor :isbn
  attr_accessor :price

  def initialize isbn, price
    @isbn = isbn
    @price = price
  end
end
```

```
→ rspec -e 'getters and setters' spec/part3_spec.rb
Run options: include {:full_description=>/getters\ and\ setters/}

BookInStock
  getters and setters
    should set ISBN [10 points]
    should set price [10 points]
    should be able to change ISBN [10 points]
    should be able to change price [10 points]

Finished in 0.0036 seconds (files took 0.08069 seconds to load)
4 examples, 0 failures
``

Although we might criticise this object that it is allowing all its collaborators to manipulate its state without any checks and balances, i.e. it is not really providing one of the key benefits of encapsulation.

We can run our constructor tests as follows:

```
$ rspec -e 'constructor' spec/part3_spec.rb
```

which should fail like so:

```
Run options: include {:full_description=>/constructor/}

BookInStock
  constructor
    should reject invalid ISBN number [10 points] (FAILED - 1)
    should reject zero price [10 points] (FAILED - 2)
    should reject negative price [10 points] (FAILED - 3)

Failures:

  1) BookInStock constructor should reject invalid ISBN number [10 points]
     Failure/Error: expect { BookInStock.new('', 25.00) }.to raise_error(ArgumentError)
       expected ArgumentError but nothing was raised
     # ./spec/part3_spec.rb:27:in 'block (3 levels) in <top (required)>'

  2) BookInStock constructor should reject zero price [10 points]
     Failure/Error: expect { BookInStock.new('isbn1', 0) }.to raise_error(ArgumentError)
       expected ArgumentError but nothing was raised
     # ./spec/part3_spec.rb:30:in 'block (3 levels) in <top (required)>'

  3) BookInStock constructor should reject negative price [10 points]
     Failure/Error: expect { BookInStock.new('isbn1', -5.0) }.to raise_error(ArgumentError)
       expected ArgumentError but nothing was raised
     # ./spec/part3_spec.rb:33:in 'block (3 levels) in <top (required)>'

Finished in 0.01331 seconds (files took 0.09387 seconds to load)
3 examples, 3 failures

Failed examples:

rspec ./spec/part3_spec.rb:26 # BookInStock constructor should reject invalid ISBN number [10 points]
rspec ./spec/part3_spec.rb:29 # BookInStock constructor should reject zero price [10 points]
rspec ./spec/part3_spec.rb:32 # BookInStock constructor should reject negative price [10 points]
```

and we can make them pass with the following code:

```rb
class BookInStock
  attr_accessor :isbn
  attr_accessor :price

  def initialize isbn, price
    raise ArgumentError if isbn.empty? or price <= 0
    @isbn = isbn
    @price = price
  end
end
```

Here we see the constructor serving as a gatekeeper to ensure that the internal state of the object cannot be in particular configurations such as negative price.  However, note the presence of the setters (via attr_accessor) allowing any collaborator to override these constraints after the object has been created.  Having setters is not bad in and of themselves (although see functional programming) but these setters should operate to ensure that they impose the necessary constraints on the objects internal state.  Is it really necessary to modify the objects state during it's lifetime? Or is sufficient to make changes directly to persistent storage and then recreate new objects with the new state?

The final set of specs can be run via:

```
$ rspec -e '#price_as_string' spec/part3_spec.rb
```

and should generate the following errors:

```
Run options: include {:full_description=>/\#price_as_string/}

BookInStock
  #price_as_string
    should be defined (FAILED - 1)
    should display 33.95 as "$33.95" [10 points] (FAILED - 2)
    should display 1.1 as $1.10 [10 points] (FAILED - 3)
    should display 20 as $20.00 [10 points] (FAILED - 4)

Failures:

  1) BookInStock #price_as_string should be defined
     Failure/Error: expect(BookInStock.new('isbn1', 10)).to respond_to(:price_as_string)
       expected #<BookInStock:0x007f9470e25958 @isbn="isbn1", @price=10> to respond to :price_as_string
     # ./spec/part3_spec.rb:38:in `block (3 levels) in <top (required)>'

  2) BookInStock #price_as_string should display 33.95 as "$33.95" [10 points]
     Failure/Error: expect(BookInStock.new('isbn11', 33.95).price_as_string).to eq('$33.95')
     
     NoMethodError:
       undefined method `price_as_string' for #<BookInStock:0x007f9470c4e800 @isbn="isbn11", @price=33.95>
     # ./spec/part3_spec.rb:41:in `block (3 levels) in <top (required)>'

  3) BookInStock #price_as_string should display 1.1 as $1.10 [10 points]
     Failure/Error: expect(BookInStock.new('isbn11', 1.1).price_as_string).to eq('$1.10')
     
     NoMethodError:
       undefined method `price_as_string' for #<BookInStock:0x007f9470c4cfc8 @isbn="isbn11", @price=1.1>
     # ./spec/part3_spec.rb:44:in `block (3 levels) in <top (required)>'

  4) BookInStock #price_as_string should display 20 as $20.00 [10 points]
     Failure/Error: expect(BookInStock.new('isbn11', 20).price_as_string).to eq('$20.00')
     
     NoMethodError:
       undefined method `price_as_string' for #<BookInStock:0x007f9470c47690 @isbn="isbn11", @price=20>
     # ./spec/part3_spec.rb:47:in `block (3 levels) in <top (required)>'

Finished in 0.01415 seconds (files took 0.09835 seconds to load)
4 examples, 4 failures

Failed examples:

rspec ./spec/part3_spec.rb:37 # BookInStock #price_as_string should be defined
rspec ./spec/part3_spec.rb:40 # BookInStock #price_as_string should display 33.95 as "$33.95" [10 points]
rspec ./spec/part3_spec.rb:43 # BookInStock #price_as_string should display 1.1 as $1.10 [10 points]
rspec ./spec/part3_spec.rb:46 # BookInStock #price_as_string should display 20 as $20.00 [10 points]
```

These can be passed as follows:

```rb
class BookInStock
  attr_accessor :isbn
  attr_accessor :price

  def initialize isbn, price
    raise ArgumentError if isbn.empty? or price <= 0
    @isbn = isbn
    @price = price
  end

  def price_as_string
    sprintf "$%.2f", price
  end 
end
```

```
→ rspec -e '#price_as_string' spec/part3_spec.rb
Run options: include {:full_description=>/\#price_as_string/}

BookInStock
  #price_as_string
    should be defined
    should display 33.95 as "$33.95" [10 points]
    should display 1.1 as $1.10 [10 points]
    should display 20 as $20.00 [10 points]

Finished in 0.00278 seconds (files took 0.09574 seconds to load)
4 examples, 0 failures

```

and the entire suite should now be green across the board:

```
rspec

Ruby intro part 1
  #sum
    should be defined
    returns correct sum [20 points]
    works on the empty array [10 points]
  #max_2_sum
    should be defined
    returns the correct sum [7 points]
    works even if 2 largest values are the same [3 points]
    returns zero if array is empty [10 points]
    returns value of the element if just one element [10 points]
  #sum_to_n
    should be defined
    returns true when any two elements sum to the second argument [30 points]
    returns false for any single element array [5 points]
    returns false for an empty array [5 points]

#hello
  should be defined
  The hello method returns the correct string [30 points]

#starts_with_consonant?
  should be defined
  classifies true cases [10 points]
  classifies false cases [10 points]
  works on the empty string [5 points]
  works on nonletters [5 points]

#binary_multiple_of_4?
  should be defined
  classifies valid binary numbers [30 points]
  rejects invalid binary numbers [10 points]

BookInStock
  should be defined
  getters and setters
    should set ISBN [10 points]
    should set price [10 points]
    should be able to change ISBN [10 points]
    should be able to change price [10 points]
  constructor
    should reject invalid ISBN number [10 points]
    should reject zero price [10 points]
    should reject negative price [10 points]
  #price_as_string
    should be defined
    should display 33.95 as "$33.95" [10 points]
    should display 1.1 as $1.10 [10 points]
    should display 20 as $20.00 [10 points]

Finished in 0.01214 seconds (files took 0.09774 seconds to load)
34 examples, 0 failures
```

The assignment is now ready to be submitted to the autograder
