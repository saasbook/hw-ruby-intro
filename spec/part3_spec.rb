describe "BookInStock" do
  it "should be defined" do
    expect { BookInStock }.not_to raise_error
  end

  describe 'getters and setters' do
    before(:each)  { @book = BookInStock.new('isbn1', 33.8) }
    it 'should set ISBN' do
      @book.isbn.should == 'isbn1'
    end
    it 'should set price' do
      @book.price.should == 33.8
    end
    it 'should be able to change ISBN' do
      @book.isbn = 'isbn2'
      @book.isbn.should == 'isbn2'
    end
    it 'should be able to change price' do
      @book.price = 300.0
      @book.price.should == 300.0
    end
  end
  describe "#price_as_string" do
    it "should be defined" do
      BookInStock.new('isbn1', 10).should respond_to(:price_as_string)
    end
    it "should display 1.1 as $1.10" do
      BookInStock.new('isbn11', 1.1).price_as_string.should == '$1.10'
    end
  end
end

