require './test/test_helper'

class OffsetTest < Minitest::Test
  def setup
    @offset = Offset.new("092415")
  end

  def test_it_exists
    assert_instance_of Offset, @offset
  end

  def test_it_has_attributes
    assert_equal "092415", @offset.date
  end

  def test_can_test_todays_date
    today = Offset.new
    Date.stubs(:today).returns(Date.new(17,04,20))
    assert_equal "170420", today.date
  end

  def test_can_square_the_date
    assert_equal "8540532225", @offset.square
  end
end
