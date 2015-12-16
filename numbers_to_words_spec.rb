require 'minitest/autorun'
require './number_to_words'

class NumberToWordsTest < MiniTest::Test
  describe "to_words" do
    it "should handle individual numbers" do
      1.to_words.must_equal("One")
      2.to_words.must_equal("Two")
      3.to_words.must_equal("Three")
      11.to_words.must_equal("Eleven")
      18.to_words.must_equal("Eighteen")
      20.to_words.must_equal("Twenty")
      38.to_words.must_equal("Thirty Eight")
      56.to_words.must_equal("Fifty Six")
      100.to_words.must_equal("One Hundred")
      222.to_words.must_equal("Two Hundred Twenty Two")
      500.to_words.must_equal("Five Hundred")
      487.to_words.must_equal("Four Hundred Eighty Seven")
      1000.to_words.must_equal("One Thousand")
      5432.to_words.must_equal("Five Thousand Four Hundred Thirty Two")
    end
  end
end