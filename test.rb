require './scientist'
require './error'
require 'rubygems'
require 'test/unit'

class ScientistTest < Test::Unit::TestCase
  """
    Test helper class
  """
  attribute :scientist, nil

  def test_h_index_equals_with_expected_value
    h_index = 3
    result = 3
    citations = [3, 0, 6, 1, 5]
    scientist = Scientist.new(citations)
    assert scientist.h_index(h_index) == result
  end

  def test_h_index_equals_with_expected_null_value
    h_index = 5
    result = nil
    citations = [3, 0, 6, 1, 5]
    scientist = Scientist.new(citations)
    assert scientist.h_index(h_index) == result
  end


  def test_reject_negative_values_for_citations
    assert_raise ScientistError do
      Scientist.new([1, 2, 3, -5])
    end
  end

  def test_reject_negative_h_index
    assert_raise ScientistError do
      scientist = Scientist.new([1, 2, 3, 5])
      scientist.h_index(-1)
    end
  end
end
