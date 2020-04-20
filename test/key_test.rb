require './test/test_helper'

class KeyTest < Minitest::Test
  def setup
    @key = Key.new("0003")
  end

  def test_it_exists
    assert_instance_of Key, @key
  end

  def test_it_has_attributes
    assert_equal "0003", @key.key
  end

  def test_can_make_keys
    expected = {
      A: 00, B: 00, C: 03, D: 03
    }
    assert_equal expected, @key.make_keys
  end

  def test_random_key
    new = Key.new
    new.stubs(:key).returns("02343")
    assert_equal "02343", new.key
  end

  def test_random_key_to_make_keys
    new = Key.new
    new.stubs(:key).returns("02343")
    expected = {A: 02, B: 23, C: 34, D: 43}
    
    assert_equal expected, new.make_keys
  end
end
