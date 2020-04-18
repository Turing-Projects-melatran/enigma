require './test/test_helper'

class ShiftTest < Minitest::Test
  def setup
    @keys = Key.new("01165")
    @offset = Offset.new("092415")
    @shift = Shift.new(@keys, @offset)
  end

  def test_it_exists
    assert_instance_of  Shift, @shift
  end

  def test_it_has_attributes
    assert_equal @keys, @shift.keys
    assert_equal @offset, @shift.offset
  end

  def test_can_make_shift_hash
    expected = {:A=>3, :B=>13, :C=>18, :D=>70}
    assert_equal expected, @shift.make_shift
  end

  def test_can_make_shifts_with_no_arguments
    keys = Key.new
    offset = Offset.new
    shift = Shift.new(keys, offset)

    assert_instance_of Shift, shift
    assert_equal keys, shift.keys
    assert_equal offset, shift.offset

    assert_equal 4, shift.make_shift.length
  end
end
