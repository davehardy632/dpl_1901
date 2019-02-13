class Library
  attr_reader :books, :include
  def initialize
    @books = []
    @include = false
  end

  def add_to_collection(book)
    @books << book
  end

  def include?(title)
    if @books.each do |book|
      book.each do |element|
        if title == element.title
          return true
        else false
        end
        end
      end
    end
  end
end
