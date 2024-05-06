require_relative 'company'
require_relative 'instance_counter'
require_relative 'valid'

class Carriage
  include Company
  include InstanceCounter
  include Valid

  attr_reader :type, :number

  NUMBER_FORMAT = /^\d{5}$/
	
  def initialize(number)
    @number = number
    @type = type
    validate!
  end

  protected

  def validate!
    raise "Wrong type of number!" if number !~ NUMBER_FORMAT
  end
end	