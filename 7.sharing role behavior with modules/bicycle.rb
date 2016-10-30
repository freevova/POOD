require 'date'
require_relative 'schedulable'

class Bicycle
  include Schedulable
  attr_reader :size, :chain, :tire_size

  def initialize(args = {})
    @size = args[:size]
    @chain = args[:chain] || default_chain
    @tire_size = args[:tire_size] || default_tire_size
  end

  def spares
    {
      chain: chain,
      tire_size: tire_size,
    }.merge(local_spares)
  end

  def default_chain
    '10-speed'
  end

  def default_tire_size
    raise NotImplementedError, "This #{self.class} cannot respond to:"
  end

  def post_initialize(args)
    nil
  end

  def local_spares
    {}
  end
end

class Schedule
  def scheduled?(schedulable, start_date, end_date)
    puts "This #{schedulable.class} " + "is not scheduled\n" + " between #{start_date} and #{end_date}"
    false
  end
end


starting = Date.parse("2015/09/04")
ending   = Date.parse("2015/09/04")

b = Bicycle.new(size: 'T', chain: '23', tire_size: '1.2')
b.schedulable?(starting, ending)
