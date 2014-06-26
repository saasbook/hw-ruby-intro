class BookInStock

  attr_accessor :isbn, :price
  
  # A book must have a nonblank ISBN and a price greater than zero
  def initialize(isbn, price)
    @isbn = isbn
    @price = price
    raise ArgumentError if @isbn.empty? || @price <= 0
  end

  # Return price as a formatted string with leading $ and 2 decimal places
  def price_as_string
    sprintf "$%.2f", self.price
  end
end
