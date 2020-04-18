require './test/test_helper'

class OffsetTest < Minitest::Test
  def setup
    @date = Offset.new("092415")
  end

  def test_it_exists
    assert_instance_of Offset, @date
  end
end
