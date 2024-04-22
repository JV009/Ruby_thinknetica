class Train
  attr_accessor :speed

  attr_reader :number, :type, :carriages, :route

  TYPES = [:pass, :cargo]

  def initialize(number, type, carriges)
    @number = number
    @type = type
    @carriges = []
    @speed = 0
  end
  
  def stop
    @speed = 0
  end 	
  
  def add_route(route)
    @route = route
    @current_station_index = 0
    current_station.get_train(self)    
  end

  def next
    current_station.send_train(self)
    @current_station_index += 1 if next_station != 0
    current_station.get_train(self)
  end

  def back
    current_station.send_train(self)
    @current_station_index -= 1 if previous_station != 0
    current_station.get_train(self)
  end

  def current_station
    @route.stations[@current_station_index]
  end
  
  def next_station
    @route.stations[current_station_index + 1]
  end
      
  def previous_station
    route[@current_station_index - 1] if @current_station_index != 0
  end

  def add_carriage(carrige)
    if @speed == 0
      @carriges << carrige
    end
  end

  def delete_carriage(carrige)
    if speed == 0
      @carriges.delete(carriage)
    else
      puts "Train in motion!"
    end
  end
end