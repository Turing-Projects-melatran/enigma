require './test/test_helper'

class KeyTest < Minitest::Test
  def setup
    @key = Key.new("01165")
  end

  def test_it_exists
    assert_instance_of Key, @key
  end

  def test_it_has_attributes
    assert_equal "01165", @key.number
  end

  def test_can_split_string
    assert_equal ["0", "1", "1", "6", "5"], @key.split_string
  end

  def test_can_make_keys
    expected = {
      A: 01, B: 11, C: 16, D: 65
    }
    assert_equal expected, @key.make_keys
  end
end
