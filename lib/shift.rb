require './lib/key'
require './lib/offset'

class Shift
  attr_reader :key, :offset, :alphabet

  def make_shift(number, date)
    key = Key.new(number)
    key_hash = key.generate_keys
    offset = Offset.new(date)
    offset_hash = offset.generate_offset
    shift_hash = key_hash.merge(offset_hash){|letter, key, offsets| key + offsets}
    shift_hash.values
  end

  def find_index_of_letters(letter)
    @alphabet = ("a".."z").to_a << " "
    @alphabet.find_index(letter)
  end

  def get_message_indexes(message)
    @alphabet = ("a".."z").to_a << " "
    new_message = message.split('')
    new_message.map do |letter|
      find_index_of_letters(letter)
    end
  end

  def calculate_forward_shift(message,number,date) #encryption
    new_message = get_message_indexes(message)
    rotated_shifts = make_shift(number, date)
    shifted_values = []
    new_message.map do |message_index|
      shifted_values << (message_index + rotated_shifts.first) %27
      rotated_shifts = rotated_shifts.rotate!
    end
    shifted_values
  end

  def encryption(message,number,date) #encryption
    forward_message = calculate_forward_shift(message,number,date)
    forward_message.map do |value|
      @alphabet[value]
    end.join
  end

  def calculate_backward_shift(message,number,date) #decryption
    new_message = get_message_indexes(message)
    rotated_shifts = make_shift(number, date)
    shifted_values = []
    new_message.map do |message_index|
      shifted_values << (message_index - rotated_shifts.first) %27
      rotated_shifts = rotated_shifts.rotate!
    end
    shifted_values
  end

  def decryption(message,number,date) #decryption
    backwards_message = calculate_backward_shift(message,number,date)
    backwards_message.map do |value|
      @alphabet[value]
    end.join
  end
end
