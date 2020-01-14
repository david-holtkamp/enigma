require_relative 'test_helper.rb'
require './lib/encryption'
require 'date'

class EncryptionTest < Minitest::Test

  def setup
    @encrypt = Encryption.new("Hello World!","02715", "040895" )
  end

  def test_it_exists
    assert_instance_of Encryption, @encrypt
  end

  def test_it_initializes
    assert_equal "Hello World!", @encrypt.message
    assert_equal "02715", @encrypt.key
    assert_equal "040895", @encrypt.date
    expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]
    assert_equal expected, @encrypt.alphabet
    assert_equal 27, @encrypt.alphabet.length 
  end


end
