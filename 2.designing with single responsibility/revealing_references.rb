class RevealingReferences
  attr_reader :wheels
  def initialize(data)
    @wheels = wheelify(data)
  end

  def diameters
    wheels.collect { |wheel| diameter(wheel) }
  end

  def diameter(wheel)
    wheel.rim + (wheel.tire * 2)
  end

  # ... now everyone can send rim/tire to wheel
  Wheel = Struct.new(:rim, :tire)

  def wheelify(data)
    data.collect { |cell| Wheel.new(cell[0], cell[1]) }
  end
end



@data = [[622, 20], [622, 23], [559, 30], [559, 40]]
