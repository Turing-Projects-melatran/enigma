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

  def test_can_make_keys
    expected = {
      A: 01, B: 11, C: 16, D: 65
    }
    assert_equal expected, @key.make_keys
  end

  def test_random_number
    new = Key.new
    new.stubs(:number).returns("02343")
    assert_equal "02343", new.number
  end

  def test_random_number_to_make_keys
    new = Key.new
    new.stubs(:number).returns("02343")

    expected = {A: 02, B: 23, C: 34, D: 43}
    assert_equal expected, new.make_keys
  end
end
