require_relative 'shift'
require_relative 'generate_key'
require_relative 'generate_date'

class Enigma
  attr_reader :key, :date, :alphabet

  def initialize
    @key = GenerateKey.random_key
    @date = GenerateDate.generate_date
    @alphabet = ("a".."z").to_a << " "
  end

  def message_chunked(message)
    message.downcase.chars.each_slice(4).to_a
  end

  def rotate_chunk(chunk, final_shift)
    chunk.map.with_index do |letter, index|
      if @alphabet.include?(letter)
        @alphabet.rotate(@alphabet.index(letter) + final_shift[index]).first
      else
        letter
      end
    end
  end

  def encrypt_message(message, final_shift)
    message_chunked(message).map do |chunk|
      rotate_chunk(chunk, final_shift)
    end.join 
  end
end
