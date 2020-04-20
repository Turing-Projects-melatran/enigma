require './test/test_helper'

class ShiftTest < Minitest::Test
  def setup
    @shift = Shift.new("LOVE MOMO", "0003", "010520")
  end

  def test_it_exists
    assert_instance_of Shift, @shift
  end

  def test_it_has_attributes
    assert_equal "love momo", @shift.message
    assert_equal "0003", @shift.key
    assert_equal "010520", @shift.offset
  end

  def test_can_generate_keys
    expected = {A: 00, B: 00, C: 03, D: 03}
    assert_equal expected, @shift.generate_keys
  end

  def test_can_generate_offset
    expected = {A: 00, B: 04, C: 00, D: 00}
    assert_equal expected, @shift.generate_offset
  end

  def test_can_make_initial_shift
    assert_equal [0, 4, 3, 3], @shift.make_initial_shift
  end

  def test_can_make_final_shift_rotation
    assert_equal 0, @shift.final_shift_rotation
  end
end
