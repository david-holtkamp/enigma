class Shift

  def create_key(key)
    a = key[0..1].to_i
    b = key[1..2].to_i
    c = key[2..3].to_i
    d = key[3..4].to_i
    [a, b, c, d]
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
