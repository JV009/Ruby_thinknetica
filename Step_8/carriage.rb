# frozen_string_literal: true

require_relative 'company'
require_relative 'instance_counter'
require_relative 'valid'

class Carriage
  include Company
  include InstanceCounter
  include Valid

  NUMBER_FORMAT = /^\d{5}$/.freeze

  attr_reader :type, :number

  def initialize(number)
    @number = number
    validate!
  end

  protected

  def validate!
    raise 'Wrong type of number!' if number !~ NUMBER_FORMAT
  end
end
