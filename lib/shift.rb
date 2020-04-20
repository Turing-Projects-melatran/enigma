class Shift
  attr_reader :message, :key, :offset

  def initialize(message, key, offset)
    @message = message.downcase
    @key = key
    @offset = offset
  end

  def generate_keys
    Key.new(@key).make_keys
  end

  def generate_offset
    Offset.new(@offset).make_offset
  end

  def make_initial_shift
    hash = generate_keys.merge(generate_offset){|letter, key, offsets| key + offsets}
    hash.values
  end

  def final_shift_rotation
    rotate_shift = make_initial_shift.first
    make_initial_shift.rotate!
    rotate_shift
  end
end
#
#   def rotate_shift(array_of_shift_values)
#    key = array_of_shift_values.first
#    array_of_shift_values.rotate!
#    key
#   end
#
# #.chars splits a message into indivdiaul letters
#   def encryption(message, key, offset) #encryption
#     shift_values = make_shift(key, offset).values
#     alphabet = ("a".."z").to_a << " "
#     message.downcase.chars.map do |letter|
#       index_of_letter = alphabet.index(letter)
#       alphabet.rotate(index_of_letter + rotate_shift(shift_values)).first
#     end.join
#   end
#
#   def decryption(message, key, offset) #decryption
#     shift_values = make_shift(key, offset).values
#     alphabet = ("a".."z").to_a << " "
#     message.downcase.chars.map do |letter|
#       index_of_letter = alphabet.index(letter)
#       alphabet.rotate(index_of_letter - rotate_shift(shift_values)).first
#     end.join
#   end
