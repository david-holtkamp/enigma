require_relative 'test_helper.rb'
require './lib/shift'
require './lib/generate_key'
require './lib/generate_date'

class ShiftTest < Minitest::Test

  def setup
    @shift = Shift.new
  end

  def test_it_exists
    assert_instance_of Shift, @shift
  end

  def test_key_shift
    assert_equal [12, 23, 34, 45], @shift.create_key("12345")
    assert_instance_of Array, @shift.create_key("12345")
  end

  def test_date_offset
    assert_instance_of Array, @shift.offset("110120")
    assert_equal 4, @shift.offset("110120").first
    assert_equal 4, @shift.offset("110120")[1]
    assert_equal 0, @shift.offset("110120")[2]
    assert_equal 0, @shift.offset("110120").last
    assert_equal [4, 4, 0, 0], @shift.offset("110120")
  end

  def test_it_can_shift
    @shift.create_key("12345")
    @shift.offset("110120")
    assert_equal [16, 27, 34, 45], @shift.shift("12345", "110120")
  end
end
