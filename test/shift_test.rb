require './test/test_helper'

class ShiftTest < Minitest::Test
  def setup
    @shift = Shift.new("LOVE MOMO", "0003", "010520")
  end

  def test_it_exists
    assert_instance_of Shift, @shift
  end

  def test_it_has_attributes
    assert_equal "LOVE MOMO", @shift.message
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
    assert_equal [0, 4, 3, 3], @shift.make_shift
  end

  def test_can_find_index_of_letter
    assert_equal 11, @shift.find_letter_index("l")
  end

  def test_can_get_message_indexes
    assert_equal [11, 14, 21, 4, 26, 12, 14, 12, 14], @shift.get_message_indexes("love momo")
  end

  def test_can_calculate_new_forward_shift
    assert_equal [11, 18, 24, 7, 26, 16, 17, 15, 14], @shift.calculate_forward_shift("love momo")
  end

  def test_it_can_do_encryption
    assert_equal "lsyh qrpo", @shift.encryption("love momo")
  end

  def test_can_calculate_backward_shift_for_message
    assert_equal [11, 14, 21, 4, 26, 12, 14, 12, 14], @shift.calculate_backward_shift("lsyh qrpo")
  end

  def test_can_do_decryption
    assert_equal "love momo", @shift.decryption("lsyh qrpo")
  end
end
