class GenerateKey

  def self.random_key
    rand.to_s[2..6]
  end
end
