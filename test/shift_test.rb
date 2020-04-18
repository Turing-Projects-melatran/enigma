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
end
