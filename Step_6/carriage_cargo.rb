require_relative 'carriage'

class CarriageCargo < Carriage

  def initialize(number)
  @type = :cargo
  super
  end	
end	