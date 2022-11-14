class BooksSearchService
  include GoogleBooksSearch

  attr_reader :google_books

  def initialize(opts)
    @google_books = GoogleBooks.new(opts)
  end

  def call(title)
    google_books.search(title)
  end
end
