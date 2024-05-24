# frozen_string_literal: true

require_relative 'carriage'

class CarriageCargo < Carriage
  attr_reader :all_volume, :occupied_volume, :free_volume, :type

  def initialize(number, volume)
    @type = :cargo
    @all_volume = volume
    @free_volume = volume
    @occupied_volume = 0
    super(number)
  end

  def load_carriage(occupied_volume)
    @occupied_volume += occupied_volume
    @free_volume -= @occupied_volume
  end
end
