class Enigma
  attr_reader :key, :date, :alphabet

  def initialize
    @key = GenerateKey.random_key
    @date = GenerateDate.generate_date
    @alphabet = ("a".."z").to_a << " "
  end


end
