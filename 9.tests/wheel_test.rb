require 'minitest/autorun'
require_relative '../2.designing with single responsibility/wheel.rb'

module DiameterizableInterfaceTest
  def test_implements_the_diameterizable_interface
    assert_respond_to(@object, :diameter)
  end
end

class WheelTest < MiniTest::Test
  include DiameterizableInterfaceTest

  def setup
    @wheel = @object = Wheel.new(rim: 26, tire: 1.5)
  end

  def test_calculates_diameter
    assert_in_delta(29, @wheel.diameter, 0.01)
  end
end
