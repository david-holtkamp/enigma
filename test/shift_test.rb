require_relative 'test_helper.rb'
require './lib/shift'
require './lib/generate_key'
require './lib/generate_date'

class ShiftTest < Minitest::Test

  # def setup
  #   @shift = Shift.new
  # end

  def test_it_exists
    shift = Shift.new

    assert_instance_of Shift, shift
  end

  def test_it_initializes
    shift = Shift.new

    assert_instance_of String, shift.key
    assert_equal 5, shift.key.length

    assert_instance_of String, shift.date
    assert_equal 6, shift.date.length
  end

  def test_key_shift
    shift = Shift.new

    shift.stubs(:key => "12345")
    expected = [12, 23, 34, 45]

    assert_equal expected, shift.create_key
    assert_instance_of Array, shift.create_key
  end

  def test_date_offset
    shift = Shift.new

    assert_instance_of Array, shift.offset("110120")
    assert_equal 4, shift.offset("110120").first
    assert_equal 4, shift.offset("110120")[1]
    assert_equal 0, shift.offset("110120")[2]
    assert_equal 0, shift.offset("110120").last
    assert_equal [4, 4, 0, 0], shift.offset("110120")
  end

  def test_it_can_shift
    shift = Shift.new

    shift.create_key
    shift.offset("110120")
    assert_equal [16, 27, 34, 45], shift.shift("12345", "110120")
  end
end
