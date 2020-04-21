require './lib/enigma'

enigma = Enigma.new

handle = File.open(ARGV[0], "r")
text = handle.read

decrypted_message = enigma.decrypt(text.chomp, ARGV[2], ARGV[3])

writer = File.open(ARGV[1], "w")
writer.write(decrypted_message[:decryption])
handle.close
writer.close

p "Created #{ARGV[1]} with the key #{decrypted_message[:key]} and a date #{decrypted_message[:date]}"
