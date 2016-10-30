require_relative('wheel')

class Gear
attr_reader :chainring, :cog, :wheel

  def initialize(args)
    @chainring = args[:chainring]
    @cog = args[:cog]
    @wheel = args[:wheel]
  end

  def ratio
    chainring / cog.to_f
  end

  def gear_inches
    ratio * wheel.diameter
  end
end

@wheel = Wheel.new(tire: 26, rim: 1.5)
puts @wheel.circumference

@gear = Gear.new(chainring: 52, cog: 11, wheel: @wheel)
puts @gear.gear_inches
puts @gear.ratio
