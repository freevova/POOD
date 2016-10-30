class Bicycle
  attr_reader :size, :parts

  def initialize(args = {})
    @size  = args[:size]
    @parts = args[:parts]
  end

  def spares
    parts.spares
  end

  def lead_days
    1
  end
end


require 'forwardable'
class Parts
  extend Forwardable
  def_delegators :@parts, :size, :each
  include Enumerable

  def initialize(parts)
    @parts = parts
  end

  def spares
    select { |part| part.need_spare }
  end
end

# class Part
#   attr_reader :name, :description, :need_spare

#   def initialize(args)
#     @name = args[:name]
#     @description = args[:description]
#     @need_spare = args.fetch(:need_spare, true)
#   end
# end

# chain = Part.new(name: 'chain', description: '10-speed')
# road_tire = Part.new(name: 'tire_size', description: '23')
# tape = Part.new(name: 'tape_color', description: 'red')
# mountain_tire = Part.new(name: 'tire_size', description: '2.1')
# rear_shock = Part.new(name: 'rear_shock', description: 'Fox')
# front_shock = Part.new(name: 'front_shock', description: 'Manitou', needs_spare: false)


# road_bike = Bicycle.new(size: 'L', parts: Parts.new([chain, road_tire, tape]))
# mountain_bike = Bicycle.new(size: 'L', parts: Parts.new([mountain_tire, front_shock, rear_shock]))

# puts mountain_bike.size
# p mountain_bike.spares




require 'ostruct'
module PartsFactory
  def self.build(config, parts_class = Parts)
    parts_class.new(config.collect { |part_config| creeate_part(part_config) })
  end

  def self.creeate_part(part_config)
    OpenStruct.new(name: part_config[0], description: part_config[1], need_spare: part_config.fetch(2, true))
  end
end


road_config =  [['chain', '10-speed'],
                ['tire_size', '23'],
                ['tape_color', 'red']]

mountain_config =  [['chain', '10-speed'],
                    ['tire_size', '2.1'],
                    ['front_shock', 'Manitou', false],
                    ['rear_shock', 'Fox']]

road_parts = PartsFactory.build(road_config)
mountain_parts = PartsFactory.build(mountain_config)
road_bike = Bicycle.new(size: 'L', parts: road_parts)
road_bike.spares
mountain_bike = Bicycle.new(size: 'L', parts: mountain_parts)
p mountain_bike.spares
