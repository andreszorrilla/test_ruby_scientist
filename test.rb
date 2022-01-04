require './scientist'
require './error'
require 'rubygems'
require 'test/unit'

class ScientistTest < Test::Unit::TestCase
  """
    Test helper class
  """

  def test_h_index_equals_with_expected_value
    result = 3
    citations = [3, 0, 6, 1, 5]
    scientist = Scientist.new(citations)
    assert scientist.h_index == result
  end

  def test_h_index_equals_with_expected_null_value
    result = nil
    citations = [3, 0, 6, 1, 5, 6, 2]
    scientist = Scientist.new(citations)
    assert scientist.h_index == result
  end

  def test_reject_negative_values_for_citations
    assert_raise ScientistError do
      Scientist.new([1, 2, 3, -5])
    end
  end
end
