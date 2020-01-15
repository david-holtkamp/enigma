require 'date'
require './lib/enigma'

enigma = Enigma.new
message = File.open(ARGV[0], 'r')

message_to_encode = message.read
message.close

encrypted_message_hash = enigma.encrypt(message_to_encode)
encrypted_message = encrypted_message_hash[:encryption]

encoded = File.open(ARGV[1], 'w')
encoded.write(encrypted_message)
encoded.close

puts "Created 'encrypted.txt' with the key #{encrypted_message_hash[:key]} and date #{encrypted_message_hash[:date]}."
