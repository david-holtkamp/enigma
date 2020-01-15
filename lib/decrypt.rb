require 'date'
require './lib/enigma'

enigma = Enigma.new
encoded = File.open(ARGV[0], 'r')

message_to_decode = encoded.read
encoded.close

decoded_message_hash = enigma.decrypt(message_to_decode, ARGV[2], ARGV[3])
decoded_message = decoded_message_hash[:decryption]

decoded = File.open(ARGV[1], 'w')
decoded.write(decoded_message)
decoded.close

puts "Created 'decrypted.txt' with the key #{decoded_message_hash[:key]} and date #{decoded_message_hash[:date]}."
