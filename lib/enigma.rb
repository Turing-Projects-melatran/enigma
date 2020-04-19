require './lib/key'
require './lib/offset'
require './lib/shift'

class Enigma
  def encrypt(message, key = nil, date = nil)
    keys = Key.new(key)
    offset = Offset.new(date)
    shift = Shift.new(keys, offset)
    encrypt_hash = {}
    encrypt_hash[:encryption] = shift.encryption(message)
    encrypt_hash[:key] = shift.key.number.to_s
    encrypt_hash[:date] = shift.offset.date.to_s
    encrypt_hash
  end

  def decrypt(ciphertext, key = nil, date = nil)
    keys = Key.new(key)
    offset = Offset.new(date)
    shift = Shift.new(keys, offset)
    decrypt_hash = {}
    decrypt_hash[:decryption] = shift.decryption(ciphertext)
    decrypt_hash[:key] = shift.key.number.to_s
    decrypt_hash[:date] = shift.offset.date.to_s
    decrypt_hash
  end
end

#encrypt shift forwards
#decrypt shift backwards
