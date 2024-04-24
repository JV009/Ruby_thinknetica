require_relative 'company'
require_relative 'instance_counter'

class Carriage
  include Company
  require_relative InstanceCounter

  attr_reader :type, :number
	
  def initialize(number, type)
    @number = number
    @type = type
  end
end	