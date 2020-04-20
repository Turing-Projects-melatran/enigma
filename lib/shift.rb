class Shift
  attr_reader :message, :key, :offset, :alphabet

  def initialize(message, key, offset)
    @message = message
    @key = key
    @offset = offset
  end

  def generate_keys
    Key.new(@key).make_keys
  end

  def generate_offset
    Offset.new(@offset).make_offset
  end

  def make_shift
    hash = generate_keys.merge(generate_offset){|letter, key, offsets| key + offsets}
    hash.values
  end

  def find_letter_index(letter)
    @alphabet = ("a".."z").to_a << " "
    @alphabet.find_index(letter)
  end

  def get_message_indexes(message)
     new_message = message.split('')
     new_message.map do |letter|
       find_letter_index(letter)
     end
  end

  def calculate_forward_shift(message) #encryption
    new_message = get_message_indexes(message)
    rotated_shifts = make_shift
    shifted_values = []
    new_message.map do |message_index|
     shifted_values << (message_index + rotated_shifts.first) %27
     rotated_shifts = rotated_shifts.rotate!
   end
   shifted_values
  end

 def encryption(message) #encryption
   message_in_indexes = calculate_forward_shift(message)
   encrypted_message = []
   message_in_indexes.map do |value|
     encrypted_message << @alphabet[value]
   end
   encrypted_message.join
 end

 def calculate_backward_shift(message) #decryption
   new_message = get_message_indexes(message)
   rotated_shifts = make_shift
   shifted_values = []
   new_message.map do |message_index|
     shifted_values << (message_index - rotated_shifts.first) %27
     rotated_shifts = rotated_shifts.rotate!
   end
   shifted_values
 end

 def decryption(message) #decryption
   message_in_indexes = calculate_backward_shift(message)
   decrypted_message = []
   message_in_indexes.map do |value|
     decrypted_message << @alphabet[value]
   end
   decrypted_message.join
 end
end
