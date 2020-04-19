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

  def test_can_make_shift
    assert_equal [3, 13, 18, 70], @shift.make_shift
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

  def test_can_find_index_of_letters
    assert_equal 11, @shift.find_index_of_letters("l")
    assert_equal 12, @shift.find_index_of_letters("m")
  end

  def test_can_get_message_indexes
    keys = Key.new("0003")
    offset = Offset.new("010520")
    shift = Shift.new(keys, offset)
    shift.make_shift

    assert_equal [11, 14, 21, 4, 26, 12, 14, 12, 14], shift.get_message_indexes("love momo")
  end

  def test_can_calculate_new_forward_values_to_shift_message
    keys = Key.new("0003")
    offset = Offset.new("010520")
    shift = Shift.new(keys, offset)

    assert_equal [11, 18, 24, 7, 26, 16, 17, 15, 14], shift.calculate_forward_values("love momo")
  end

  def test_can_forward_shift
    keys = Key.new("0003")
    offset = Offset.new("010520")
    shift = Shift.new(keys, offset)

    assert_equal "lsyh qrpo", shift.forward_shift_message("love momo")
  end

  def test_can_calculate_backward_values_for_message
    keys = Key.new("0003")
    offset = Offset.new("010520")
    shift = Shift.new(keys, offset)

    assert_equal [11, 14, 21, 4, 26, 12, 14, 12, 14], shift.calculate_backward_values("lsyh qrpo")
  end
end
