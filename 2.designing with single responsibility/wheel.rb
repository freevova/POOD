class Wheel
  attr_reader  :rim, :tire
  def initialize(args)
    @tire = args[:tire]
    @rim = args[:rim]
  end

  def diameter
    rim + (tire * 2)
  end

  def circumference
    diameter * Math::PI
  end
end
