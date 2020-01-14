class Encryption
  attr_reader :message, :key, :date, :alphabet

  def initialize(message, key, date)
    @message = message
    @key = key
    @date = date
    @alphabet = ("a".."z").to_a << " "
  end

end
