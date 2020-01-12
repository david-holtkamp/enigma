require_relative 'test_helper.rb'
require './lib/generate_key'

class GenerateKeyTest < Minitest::Test

  def test_it_can_generate_random_number
    GenerateKey.expects(:random_key).returns("12345")

    assert_equal "12345", GenerateKey.random_key
  end

  def test_it_returns_string
    assert_instance_of String, GenerateKey.random_key
  end

  def test_it_returns_random_number_of_proper_length
    assert_equal 5, GenerateKey.random_key.length
  end
end
