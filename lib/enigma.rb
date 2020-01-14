class Enigma 
  attr_reader :message, :key, :date, :alphabet

  def initialize
    @key = key
    @date = date
    @alphabet = ("a".."z").to_a << " "
  end
end
