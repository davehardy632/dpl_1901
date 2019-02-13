require './test/test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/library'
require './lib/author'
require './lib/book'

class LibraryTest < Minitest::Test
  def setup
    @dpl = Library.new
    @nk_jemisin = Author.new({first_name: "N.K.", last_name: "Jemisin"})
    @fifth_season = @nk_jemisin.add_book("The Fifth Season", "November 3, 2015")
    @kingdoms = @nk_jemisin.add_book("The Hundred Thousand Kingdoms", "2010")

    @harper_lee  = Author.new({first_name: "Harper", last_name: "Lee"})
    @mockingbird = @harper_lee.add_book("To Kill a Mockingbird", "July 11, 1960")
  end

  def test_library_exists
    assert_instance_of Library, @dpl
  end

  def test_add_to_collection
    @dpl.add_to_collection(@fifth_season)

    assert_equal [@fifth_season], @dpl.books

    @dpl.add_to_collection(@mockingbird)
    @dpl.add_to_collection(@kingdoms)

    assert_equal [@fifth_season, @mockingbird, @kingdoms] ,@dpl.books
  end

  def test_include_method
    @dpl.add_to_collection(@fifth_season)
    @dpl.add_to_collection(@mockingbird)
    @dpl.add_to_collection(@kingdoms)


    assert_equal true, @dpl.include?("To Kill a Mockingbird")
  end

  def test_card_catalogue


  end


end
