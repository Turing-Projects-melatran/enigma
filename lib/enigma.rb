require './lib/key'
require './lib/offset'
require './lib/shift'

class Enigma
  def encrypt(message, key = Key.new, date = Offset.new)
    shift = Shift.new
    encrypt_hash = {}
    encrypt_hash[:encryption] = shift.encryption(message, key, date)
    encrypt_hash[:key] = key
    encrypt_hash[:date] = date
    encrypt_hash
  end

  def decrypt(ciphertext, key = Key.new, date = Offset.new)
    shift = Shift.new
    decrypt_hash = {}
    decrypt_hash[:decryption] = shift.decryption(ciphertext, key, date)
    decrypt_hash[:key] = key
    decrypt_hash[:date] = date
    decrypt_hash
  end
end

#encrypt shift forwards
#decrypt shift backwards
