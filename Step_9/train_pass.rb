# frozen_string_literal: true

require_relative 'train'

class TrainPass < Train
  validate :number, :presence
  validate :number, :type_format, /\A[\p{L}\d]{3}-?[\p{L}\d]{2}\z/
  validate :number, :type_class, String

  def initialize(number)
    @type = :pass
    super
  end

  def add_carriage(carriage)
    if carriage.type == @type
      super
    else
      puts 'Different types of train and wagon!'
    end
  end
end
