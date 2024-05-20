# frozen_string_literal: true

require_relative 'train'

class TrainCargo < Train
  def initialize(number)
    @type = :cargo
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
