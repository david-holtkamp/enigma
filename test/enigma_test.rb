require_relative 'test_helper.rb'
require './lib/encryption'
require 'date'

class EnigmaTest < Minitest::Test

  def setup
    @enigma = Enigma.new
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_it_initializes
    assert_equal "Hello World!", @enigma.message
    assert_equal "02715", @enigma.key
    assert_equal "040895", @enigma.date
    expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]
    assert_equal expected, @enigma.alphabet
    assert_equal 27, @enigma.alphabet.length
  end


end
