require_relative 'test_helper.rb'
require './lib/enigma'
require 'date'

class EnigmaTest < Minitest::Test

  def setup
    @enigma = Enigma.new
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_it_initializes
    @enigma.stubs(:key => "02715")
    assert_equal "02715", @enigma.key
    @enigma.stubs(:date => "040895")
    assert_equal "040895", @enigma.date
    expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]
    assert_equal expected, @enigma.alphabet
    assert_equal 27, @enigma.alphabet.length
  end

  def test_it_can_use_generate_shift_method
    @enigma.stubs(:key => "02715")
    @enigma.stubs(:date => "040895")
    assert_instance_of Array, @enigma.shift
    assert_equal 4, @enigma.shift.length
  end

  def test_it_can_break_up_message
    expected = [['h', 'e', 'l', 'l'], ['o', ' ', 'w', 'o'], [ 'r', 'l', 'd', '!']]

    assert_equal expected, @enigma.message_chunked("Hello World!")
  end
end
