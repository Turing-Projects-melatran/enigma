require './lib/key'
require './lib/offset'
require './lib/shift'

class Enigma
  def encrypt(message, key = rand(0..9999).to_s.rjust(5, "0"), date = date = Date.today.strftime("%d%m%y"))
    shift = Shift.new(message, key, date)
    message_to_be_encrypt = shift.encryption(message)
    encrypt_hash = {}
    encrypt_hash[:encryption] = message_to_be_encrypt
    encrypt_hash[:key] = key
    encrypt_hash[:date] = date
    encrypt_hash
  end

  def decrypt(message, key = rand(0..9999).to_s.rjust(5, "0"), date = date = Date.today.strftime("%d%m%y"))
    shift = Shift.new(message, key, date)
    message_to_decrypt = shift.decryption(message)
    decrypt_hash = {}
    decrypt_hash[:decryption] = message_to_decrypt
    decrypt_hash[:key] = key
    decrypt_hash[:date] = date
    decrypt_hash
  end
end


#encrypt shift forwards
#decrypt shift backwards
