require 'minitest/autorun'
require_relative '../5.duck typing/trip.rb'

module PreparerInterfaceTest
  def test_implements_the_preparer_interface
    assert_respond_to(@object, :prepare_trip)
  end
end

class TripTest < MiniTest::Test
  def test_requests_trip_preparation
    @preparer = MiniTest::Mock.new
    @trip = Trip.new
    @preparer.expect(:prepare_trip, nil, [@trip])
    @trip.prepare([@preparer])
    @preparer.verify
  end
end

class MechanicTest < MiniTest::Test
  include PreparerInterfaceTest

  def setup
    @mechanic = @object = Mechanic.new
  end
end

class TripCoordinatorTest< MiniTest::Test
  include PreparerInterfaceTest

  def setup
    @trip_coordinator = @object = TripCoordinator.new
  end
end

class DriverTest < MiniTest::Test
  include PreparerInterfaceTest

  def setup
    @driver = @object = Driver.new
  end
end
