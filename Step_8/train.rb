# frozen_string_literal: true

require_relative 'company'
require_relative 'instance_counter'
require_relative 'valid'

class Train
  include Company
  include InstanceCounter
  include Valid

  NUMBER_FORMAT = /\A[\p{L}\d]{3}-?[\p{L}\d]{2}\z/.freeze

  attr_accessor :speed

  attr_reader :number, :type, :carriage, :route, :stations

  @@trains = []

  def initialize(number)
    @number = number
    @type = type
    @carriges = []
    @speed = 0
    validate!
    register_instance
  end

  def stop
    @speed = 0
  end

  def add_route(route)
    @route = route
    @current_station_index = 0
    @route.stations[0].get_train(self)
  end

  def next
    current_station.send_train(self)
    @current_station_index += 1 if next_station != 0
    current_station.get_train(self)
  end

  def back
    current_station.send_train(self)
    @current_station_index -= 1 if previous_station != 0
    current_station.get_train(self)
  end

  def current_station
    @route.stations[@current_station_index]
  end

  def next_station
    @route.stations[current_station_index + 1]
  end

  def previous_station
    route[@current_station_index - 1] unless @current_station_index.zero?
  end

  def add_carriage(carriage)
    @carriges << carriage if @speed.zero?
  end

  def delete_carriage(carriage)
    @carriges.delete(carriage) if speed.zero?
  end

  def self.find(number)
    @@trains[number]
  end

  def all_carriages(&block)
    @carriges.each.with_index(1, &block)
  end

  protected

  def validate!
    raise 'Wrong type of number!' if number !~ NUMBER_FORMAT
  end
end
