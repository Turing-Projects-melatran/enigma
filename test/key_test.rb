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
    assert_equal ({}), @key.keys
  end

  def test_can_generate_random_number
    assert_equal "01307", @key.generate_random
  end
end
