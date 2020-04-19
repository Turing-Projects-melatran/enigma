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

  def test_can_generate_keys
    expected = {:A=>01, :B=>11, :C=>16, :D=>65}
    assert_equal expected, @key.generate_keys
  end

  def test_can_generate_random_number
    random = Key.new
    random.stubs(:rand).returns(2343)
    expected = {:A=>02, :B=>23, :C=>34, :D=>43}
    assert_equal expected, random.generate_keys
  end

  def test_can_make_keys
    expected = {
      A: 01, B: 11, C: 16, D: 65
    }
    assert_equal expected, @key.make_keys
  end
end
