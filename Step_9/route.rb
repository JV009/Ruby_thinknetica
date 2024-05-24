# frozen_string_literal: true

require_relative 'instance_counter'
require_relative 'valid'

class Route
  include InstanceCounter
  include Valid

  NAME_FORMAT = /\A[a-z0-9]{3,20}\z/i.freeze

  attr_reader :interstation, :number_route, :start_station, :end_station, :route, :stations

  def initialize(start_station, end_station, number_route)
    @stations = [start_station, end_station]
    @number_route = number_route
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
    raise 'Wrong type of route number!' if number_route !~ NAME_FORMAT
  end
end
