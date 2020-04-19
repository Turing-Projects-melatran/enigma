require './lib/key'
require './lib/offset'

class Shift
  attr_reader :key, :offset, :alphabet

  def initialize(key, offset)
    @key = key
    @offset = offset
  end

  def make_shift
    key_hash = @key.make_keys
    offset_hash = @offset.make_offset
    shift_hash =key_hash.merge(offset_hash){|letter, key, offsets| key + offsets}
    shift_hash.values
  end

  def find_index_of_letters(letter)
    @alphabet = ("a".."z").to_a << " "
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

  def forward_shift_message(message) #encrytion
    forward_message = calculate_forward_values(message)
    forward_message.map do |value|
      @alphabet[value]
    end.join
  end

  def calculate_backward_values(message) #dycryption
    new_message = get_message_indexes(message)
    rotated_shifts = make_shift
    shifted_values = []
    new_message.map do |message_index|
      shifted_values << (message_index - rotated_shifts.first) %27
      rotated_shifts = rotated_shifts.rotate!
    end
    shifted_values
  end

  def backward_shift_message(message) #dycryption
    backwards_message = calculate_backward_values(message)
    backwards_message.map do |value|
      @alphabet[value]
    end.join
  end
end
