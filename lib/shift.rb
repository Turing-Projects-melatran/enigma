require './lib/key'
require './lib/offset'

class Shift
  attr_reader :keys, :offset

  def initialize(keys, offset)
    @keys = keys
    @offset = offset
  end

  def make_shift
    keys_hash = @keys.make_keys
    offset_hash = @offset.make_offset
    shift_hash =keys_hash.merge(offset_hash){|letter, keys, offsets| keys + offsets}
    shift_hash.values
  end


end
