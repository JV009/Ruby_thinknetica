require_relative 'instance_counter'
require_relative 'valid'

class Station
  include InstanceCounter
  include Valid
  
  attr_reader :trains, :name_station

  NAME_FORMAT = /\A[a-z0-9]{2,15}\z/i

  @@stations = []

  def initialize(name_station)
    @name_station = name_station
    @trains = []
    @@stations << self
    register_instance
    validate!
  end
  
  def get_train(train)
    @trains << train
  end
  
  def send_train(train)
    @trains.delete(train)
  end
  
  def type_trains
    @type = {cargo:0, pass:0}
    @trains.each do |train|
      @type[train.type] += 1
    end  
  end

  def self.all
    @@stations
  end

  protected

  def validate!
    raise "Wrong type of name station!" if name_station !~ NAME_FORMAT
  end
end 

