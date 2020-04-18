require './lib/key'
require './lib/offset'

class Shift
  attr_reader :keys, :offset

  def initialize(keys, offset)
    @keys = keys
    @offset = offset
  end
end
