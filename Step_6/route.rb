require_relative 'instance_counter'
require_relative 'valid'

class Route
  include InstanceCounter
  include Valid
  
  attr_reader :stations, :number_route, :start_station, :end_station

  NAME_FORMAT = /\A[a-z0-9]{3,20}\z/i 	

  def initialize(start_station, end_station, number)
    @stations = [start_station, end_station]
    @number_route = number
    validate!
    register_instance
  end	

  def add_station(interstation)
    @stations.insert(-2, interstation)
  end
  
  def delete_station(interstation)
    @stations.delete(interstation)
  end

  protected

  def validate!
    raise "Wrong type of name station!" if number !~ NAME_FORMAT
  end
end
