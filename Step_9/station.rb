# frozen_string_literal: true

require_relative 'instance_counter'
require_relative 'validation'
require_relative 'accessors'

class Station
  include InstanceCounter
  include Validation
  include Accessors

  attr_reader :trains, :name_station

  attr_accessor_with_history :name
  strong_attr_accessor :name, String

  validate :name, :presence
  validate :name, :type_format, /\A[a-z0-9]{2,15}\z/i
  validate :name, :type_class, String

  @@stations = []

  def initialize(name)
    @name = name
    @trains = []
    @@stations << self
    register_instance
    validate!
  end

  def get_train(train)
    @trains << train
  end

  def send_train(train)
    @trains.delete(train)
  end

  def type_trains
    @type = { cargo: 0, pass: 0 }
    @trains.each do |train|
      @type[train.type] += 1
    end
  end

  def self.all
    @@stations
  end

  def all_trains(&block)
    @trains.each(&block)
  end
end
