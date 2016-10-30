require 'minitest/autorun'
require_relative '../2.designing with single responsibility/gear.rb'

class DiameterDouble
  def diameter
    10
  end
end

module DiameterizableInterfaceTest
  def test_implements_the_diameterizable_interface
    assert_respond_to(@object, :diameter)
  end
end

class DiameterDoubleTest < MiniTest::Test
include DiameterizableInterfaceTest

  def setup
    @object = DiameterDouble.new
  end
end

class GearTest < MiniTest::Test
  def test_calculates_gear_inches
    gear = Gear.new(chainring: 52, cog: 11, wheel: DiameterDouble.new)
    assert_in_delta(47.27, gear.gear_inches, 0.01)
  end
end
