require './lib/key'
require './lib/offset'

class Shift
  attr_reader :keys, :offset, :alphabet

  def initialize(keys, offset)
    @keys = keys
    @offset = offset
    @alphabet = ("a".."z").to_a << " "
  end

  def make_shift
    keys_hash = @keys.make_keys
    offset_hash = @offset.make_offset
    shift_hash =keys_hash.merge(offset_hash){|letter, keys, offsets| keys + offsets}
    shift_hash.values
  end

  def find_index_of_letters(letter)
    @alphabet.find_index(letter)
  end

  def get_message_indexes(message)
    new_message = message.split('')
    new_message.map do |letter|
      find_index_of_letters(letter)
    end
  end

  def calculate_forward_values(message) #encryption
    new_message = get_message_indexes(message)
    rotated_shifts = make_shift
    shifted_values = []
    new_message.map do |message_index|
      shifted_values << (message_index + rotated_shifts.first) %27
      rotated_shifts = rotated_shifts.rotate!
    end
    shifted_values
  end
end
