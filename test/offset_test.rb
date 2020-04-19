require './test/test_helper'

class OffsetTest < Minitest::Test
  def setup
    @date = Offset.new("092415")
  end

  def test_it_exists
    assert_instance_of Offset, @date
  end

  def test_it_has_attributes
    assert_equal "092415", @date.date
  end

  def test_can_generate_offset
    assert_equal "092415", @date.generate_offset
  end

  def test_can_generate_today
    new_value = Offset.new
    Date.stubs(:today).returns(Date.new(2020, 04, 17))
    assert_equal "170420", new_value.generate_offset
  end

  def test_can_square_the_date
    assert_equal "8540532225", @date.square
  end

  def test_can_take_last_four_digits
    @date.square

    assert_equal ["2", "2", "2", "5"], @date.last_four
  end

  def test_can_create_date_hash
    @date.square
    @date.last_four
    expected = {A: 2, B: 2, C: 2, D: 5}

    assert_equal expected, @date.make_offset
  end
end
