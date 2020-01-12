class Shift

  def create_key(key)
    a = key[0..1].to_i
    b = key[1..2].to_i
    c = key[2..3].to_i
    d = key[3..4].to_i
    [a, b, c, d]
  end
end
