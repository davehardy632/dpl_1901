require './test/test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/book'
require './lib/author'
require 'pry'

class AuthorTest < Minitest::Test
  def setup
    @nk_jemisin = Author.new({first_name: "N.K.", last_name: "Jemisin"})
  end

  def test_author_exists
    assert_instance_of Author, @nk_jemisin
  end

  def test_author_has_attributes
    assert_equal "N.K.", @nk_jemisin.first_name
    assert_equal "Jemisin", @nk_jemisin.last_name
  end

  def test_author_has_no_books_yet
    assert_equal [], @nk_jemisin.books
  end

  def test_add_book
    @the_fifth_season = Book.new({author_first_name: "N.K.", author_last_name: "Jemisin", title: "The Fifth Season" , publication_date: "November 3, 2015"})
    @nk_jemisin.add_book("The Fifth Season", "November 3, 2015")

    assert_equal [@the_fifth_season], @nk_jemisin.books

    @the_hundred_thousand_kingdoms = Book.new({author_first_name: "N.K.", author_last_name: "Jemisin", title: "The Hundred Thousand Kingdoms" , publication_date: "2010"})

    @nk_jemisin.add_book("The Hundred Thousand Kingdoms", "2010")

    assert_equal [@the_fifth_season, @the_hundred_thousand_kingdoms], @nk_jemisin.books
  end
end
