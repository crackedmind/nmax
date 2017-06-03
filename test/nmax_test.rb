require "test_helper"

class NmaxTest < Minitest::Test
  # def test_that_it_has_a_version_number
  #   refute_nil ::Nmax::VERSION
  # end

  def test_from_string_io
    test_string = StringIO.new(%q{
      test1 sdf2 p3
      4 sdfa5
    })
    assert_equal ::Nmax.perform(5, test_string), [5,4,3,2,1]
  end

  def test_with_nil 
    test_string = StringIO.new(%q{
      test sdf p
       sdfa
    })
    assert_equal ::Nmax.perform(5, test_string), []
  end

  def test_from_file
    assert_equal ::Nmax.perform(5, File.open("./test/fixtures/sample.txt")), [53759, 9627, 9458, 8699, 7687]
  end
end
