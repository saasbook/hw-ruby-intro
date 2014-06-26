# Solutions for Ruby Intro part 2

# `hello(name)` returns the string "Hello, " concatenated with `name`.
def hello(name)
  "Hello, #{name}"
end

# Returns true iff `string` starts with a consonant (case-insensitive).
def starts_with_consonant?(string)
  string !~ /^[aeiou]/i  &&
    string =~ /^\w/
end

# Returns true iff `string` interpreted as a binary number would be a multiple
# of 4, that is, if all characters in the string are 1 or 0 and if the last
# two are `00`. `0` also passes.
def binary_multiple_of_4?(string)
  #string =~ /^[01]*00$/
  return false if string.to_s == '' || string.delete('01') != ''
  string.to_i(2) % 4 == 0
end

