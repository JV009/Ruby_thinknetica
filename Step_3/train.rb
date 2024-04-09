class Train
  attr_accessor :speed

  attr_reader :number, :type, :carriages

  TYPES = [:pass, :cargo]

  def initialize(number, type, carriges)
  @number = number
  @type = type
  @carriges = carriges.to_i
  @speed = 0
  end
  
  def stop
    @speed = 0
  end 	

  def add_carriages
    @carriages += 1 if speed == 0
  end
  
  def del_carriages
    @carriages -= 1 if speed == 0
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
      
  def previous_staton
    route[@current_station_index - 1] if @current_station_index != 0
  end  
end