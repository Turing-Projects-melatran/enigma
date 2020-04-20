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

  def test_it_can_square_date
    assert_equal 8540532225, @date.square
  end

  def test_can_create_date_hash
    #2225
    expected = {A: 2, B: 2, C: 2, D: 5}

    assert_equal expected, @date.make_offset
  end

  def test_can_generate_today
    new = Offset.new
    new.stubs(:date).returns("200420")

    assert_equal "200420", new.date
  end

  def test_can_make_today_hash
    new = Offset.new
    new.stubs(:date).returns("200420")
    expected = {A: 06, B: 04, C:00, D:00}
    assert_equal expected, new.make_offset
  end
end
