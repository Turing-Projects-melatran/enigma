require './test/test_helper'

class KeyOffsetTest < Minitest::Test
  def setup
    @keyoffset = KeyOffset.new("01165", "092415")
  end

  def test_it_exists
    assert_instance_of KeyOffset, @keyoffset
  end

  def test_it_has_attributes
    assert_equal "01165", @keyoffset.key
    assert_equal "092415", @keyoffset.date
  end

  def test_can_generate_keys
    expected = {:A=>01, :B=>11, :C=>16, :D=>65}
    assert_equal expected, @keyoffset.generate_keys
  end

  def test_can_generate_random_number
    random = KeyOffset.new(key = nil, "092415")
    random.stubs(:rand).returns(2343)
    expected = {:A=>02, :B=>23, :C=>34, :D=>43}
    assert_equal expected, random.generate_keys
  end

  def test_can_make_keys
    expected = { A: 01, B: 11, C: 16, D: 65}
    assert_equal expected, @keyoffset.make_keys
  end

  def test_can_generate_offset
    expected = {:A=>2, :B=>2, :C=>2, :D=>5}
    assert_equal expected, @keyoffset.generate_offset
  end

  def test_can_generate_today
    random = KeyOffset.new("01165", date = nil)
    Date.stubs(:today).returns(Date.new(2020, 04, 17))
    expected = {:A=>6, :B=>4, :C=>0, :D=>0}
    assert_equal expected, random.generate_offset
  end

  def test_can_create_date_hash
    expected = {A: 2, B: 2, C: 2, D: 5}

    assert_equal expected, @keyoffset.make_offset
  end

  def test_can_make_shift
    assert_equal [3, 13, 18, 70], @keyoffset.make_shift
  end
end
