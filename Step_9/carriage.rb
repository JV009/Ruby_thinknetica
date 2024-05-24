# frozen_string_literal: true

require_relative 'company'
require_relative 'instance_counter'
require_relative 'validation'
require_relative 'accessors'

class Carriage
  include Company
  include InstanceCounter
  include Validation
  include Accessors

  attr_reader :type, :number

  attr_accessor_with_history :number
  strong_attr_accessor :number, String

  validate :number, :presence
  validate :number, :type_format, /^\d{5}$/
  validate :number, :type_class, String

  def initialize(number)
    @number = number
    register_instance
    validate!
  end
end
