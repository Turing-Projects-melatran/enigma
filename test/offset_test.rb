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
    expected = {:A=>2, :B=>2, :C=>2, :D=>5}
    assert_equal expected, @date.generate_offset
  end

  def test_can_generate_today
    new_value = Offset.new
    Date.stubs(:today).returns(Date.new(2020, 04, 17))
    expected = {:A=>6, :B=>4, :C=>0, :D=>0}
    assert_equal expected, new_value.generate_offset
  end

  def test_can_create_date_hash
    expected = {A: 2, B: 2, C: 2, D: 5}
    
    assert_equal expected, @date.make_offset
  end
end
