require_relative 'shift'

class Enigma
  attr_reader :key, :date, :alphabet, :shift

  def initialize
    @key = GenerateKey.random_key
    @date = GenerateDate.generate_date
    @alphabet = ("a".."z").to_a << " "
    @shift = Shift.generate_shift(key = @key, date = @date)
    require "pry"; binding.pry
  end
end
