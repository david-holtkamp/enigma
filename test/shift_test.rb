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

  def test_it_initializes
    assert_instance_of String, @shift.key
    assert_equal 5, @shift.key.length

    assert_instance_of String, @shift.date
    assert_equal 6, @shift.date.length
  end

  def test_key_shift
    @shift.stubs(:key => "12345")
    expected = [12, 23, 34, 45]

    assert_equal expected, @shift.create_key
    assert_instance_of Array, @shift.create_key
  end

  def test_date_offset
    @shift.stubs(:date => "110120")
    expected = [4, 4, 0, 0]
    assert_instance_of Array, @shift.offset
    assert_equal 4, @shift.offset.first
    assert_equal 4, @shift.offset[1]
    assert_equal 0, @shift.offset[2]
    assert_equal 0, @shift.offset.last
    assert_equal expected, @shift.offset
  end

  def test_it_can_shift
    @shift.stubs(:key => "12345")
    @shift.stubs(:date => "110120")

    assert_equal [16, 27, 34, 45], @shift.shift
  end
end
