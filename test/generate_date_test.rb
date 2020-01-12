require_relative 'test_helper.rb'
require './lib/generate_date'

class GenerateDateTest < Minitest::Test

  def test_it_generates_date
    GenerateDate.expects(:generate_date).returns("110120")

    assert_equal "110120", GenerateDate.generate_date
  end

  def test_it_returns_string
    assert_instance_of String, GenerateDate.generate_date
  end
end
