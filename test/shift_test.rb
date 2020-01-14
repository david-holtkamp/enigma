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
    @shift.stubs(:key => "02715")
    expected = [02, 27, 71, 15]

    assert_equal expected, Shift.create_key("02715")
    assert_instance_of Array, Shift.create_key("02715")
  end

  def test_date_offset
    @shift.stubs(:date => "040895")
    expected = [1, 0, 2, 5]
    assert_instance_of Array, Shift.offset("040895")
    assert_equal 1, Shift.offset("040895").first
    assert_equal 0, Shift.offset("040895")[1]
    assert_equal 2, Shift.offset("040895")[2]
    assert_equal 5, Shift.offset("040895").last
    assert_equal expected, Shift.offset("040895")
  end

  def test_it_can_shift
    @shift.stubs(:key => "02715")
    @shift.stubs(:date => "040895")

    assert_equal [3, 27, 73, 20], Shift.generate_shift("02715", "040895")
  end
end
