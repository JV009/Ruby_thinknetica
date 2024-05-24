# frozen_string_literal: true

require_relative 'carriage'

class CarriagePass < Carriage
  attr_reader :count_seats, :occupied_seats, :free_seats, :type

  validate :number, :presence
  validate :number, :type_format, /^\d{5}$/
  validate :number, :type_class, String

  def initialize(number, seats)
    @type = :pass
    @count_seats = seats
    @free_seats = seats
    @occupied_seats = 0
    super(number)
  end

  def take_seat
    @occupied_seats += 1
    @free_seats -= @occupied_seats
  end
end
