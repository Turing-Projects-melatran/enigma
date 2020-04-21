require './lib/enigma'

enigma = Enigma.new

handle = File.open(ARGV[0], "r")
text = handle.read

encrypted_message = enigma.encrypt(text.chomp)
writer = File.open(ARGV[1], "w")
writer.write(encrypted_message[:encryption])
handle.close
writer.close

p "Created #{ARGV[1]} with the key #{encrypted_message[:key]} and a date #{encrypted_message[:date]}"
