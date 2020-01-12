require_relative './generate_key'
require_relative './generate_date'

class Shift
  attr_reader :key, :date

  def initialize(key = GenerateKey.random_key, date = GenerateDate.generate_date)
    @key = key
    @date = date
  end

  def create_key
    key.split('').each_cons(2).map do |first, second|
      (first + second).to_i
    end
  end

  def offset(date)
    squared = (date.to_i ** 2).to_s
    a = squared[-4].to_i
    b = squared[-3].to_i
    c = squared[-2].to_i
    d = squared[-1].to_i
    [a, b, c, d]
  end

  def shift(key, date)
    keys = create_key(key)
    date_shift = offset(date)
    a = keys[0] + date_shift[0]
    b = keys[1] + date_shift[1]
    c = keys[2] + date_shift[2]
    d = keys[3] + date_shift[3]
    [a, b, c, d]
  end
end
