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

  def encrypt_chunk(chunk, final_shift)
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
      encrypt_chunk(chunk, final_shift)
    end.join
  end

  def encrypt(message, key = @key, date = @date)
    final_shift = Shift.generate_shift(key, date)
    {
      encryption: encrypt_message(message, final_shift),
      key: key,
      date: date
    }
  end

  def decrypt_chunk(chunk, final_shift)
    chunk.map.with_index do |letter, index|
      if @alphabet.include?(letter)
        @alphabet.rotate(@alphabet.index(letter) - final_shift[index]).first
      else
        letter
      end
    end
  end

  def decrypt_message(encrypted_message, final_shift)
    message_chunked(encrypted_message).map do |chunk|
      decrypt_chunk(chunk, final_shift)
    end.join 
  end
end
