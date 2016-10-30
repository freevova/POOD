class SomeFramework
  class Gear
    attr_reader :chainring, :cog, :wheel

    def initialize(chainring, cog, wheel)
      @chainring = chainring
      @cog       = cog
      @wheel     = wheel
    end
  end
end

module GearWrapper
  def self.gear(args)
    SomeFramework::Gear.new(chainring: args[:chainring],
                            cog:       args[:cog],
                            wheel:     args[:wheel])
end


gear = GearWrapper.gear(chainring: 52, cog: 11, wheel: Wheel.new(26, 1.5))
