require_relative 'carriage'

class CarriagePass < Carriage
	
  def initialize(number)
  @type = :pass  
  super
  end
end	