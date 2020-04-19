require './test/test_helper'

class ShiftTest < Minitest::Test
  def setup
    @shift = Shift.new
  end

  def test_it_exists
    @shift = Shift.new
    assert_instance_of Shift, @shift
  end

  def test_can_make_shift
    assert_equal [3, 13, 18, 70], @shift.make_shift("01165", "092415")
  end

  def test_can_find_index_of_letters
    assert_equal 11, @shift.find_index_of_letters("l")
    assert_equal 12, @shift.find_index_of_letters("m")
  end

  def test_can_get_message_indexes
    @shift.make_shift("0003", "010520")

    assert_equal [11, 14, 21, 4, 26, 12, 14, 12, 14], @shift.get_message_indexes("love momo")
  end

  def test_can_calculate_new_forward_shift
    assert_equal [11, 18, 24, 7, 26, 16, 17, 15, 14], @shift.calculate_forward_shift("love momo", "0003", "010520")
  end

  def test_it_can_do_encryption
    assert_equal "lsyh qrpo", @shift.encryption("love momo", "0003", "010520")
  end
  #
  def test_can_calculate_backward_shift_for_message
    assert_equal [11, 14, 21, 4, 26, 12, 14, 12, 14], @shift.calculate_backward_shift("lsyh qrpo","0003", "010520")
  end

  def test_can_do_decryption
    assert_equal "love momo", @shift.decryption("lsyh qrpo","0003", "010520")
  end
end
