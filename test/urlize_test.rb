require 'test/unit'
require '../lib/urlize'
require '../init'

class UrlizeTest < Test::Unit::TestCase
	
	def test_should_lowercase
		correct_word = "testword"
		assert_equal correct_word, "TestWord".urlize
		assert_equal correct_word, 'TESTWord'.urlize
	end
	
	def test_should_remvoe_symbols
		assert_equal "chrischerry", "(\*\&\@(\#\{\$(chris)}))cherry".urlize
		assert_equal "chris-cherry", "chris\!\@\#\$\%\^\&*-=+Cherry".urlize
	end
	
	def test_should_keep_numbers
		correct_word = "1234"
		assert_equal correct_word, "1234".urlize
		assert_equal correct_word, "_1+2@3!4&".urlize
	end
	
	def test_should_convert_spaces_to_dashes
		correct_word = "hello-there-everyone"
		assert_equal correct_word, "hello there everyone".urlize
		assert_equal correct_word, "hello     there     everyone".urlize
	end
	
	def test_should_remove_trailing_spaces
		correct_word = "test-string"
		assert_equal correct_word, "test string ".urlize
		assert_equal correct_word, "test string         ".urlize
	end
	
	def test_should_remove_prefix_spaces
		correct_word = "test-string"
		assert_equal correct_word, " test string".urlize
		assert_equal correct_word, "           test string".urlize
	end
  
  def test_should_keep_dashes_in_tact
    assert_equal "keep-my-dash", "Keep-My Dash".urlize
    assert_equal "keep-my-dashes", "Keep-my-Dashes".urlize
  end

  def test_should_convert_underscores
    assert_equal "convert-my-underscore", "Convert_My Underscore".urlize
    assert_equal "convert-my-underscore", "Convert_my_underscore".urlize
  end
  
  def test_should_keep_dashes_and_remove_spaces
    assert_equal "dont-forget-dashes-with-spaces", "Dont forget - dashes -- with  --  spaces".urlize 
  end
  
  def test_should_put_dashes_instead_of_hyphens
    assert_equal "removehyphen", "removeâ€”hyphen".urlize
    assert_equal "multiplehyphenshereandthere", "multipleâ€”hyphensâ€”hereâ€”andâ€”there".urlize
  end



end
