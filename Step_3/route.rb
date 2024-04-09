class Route
  attr_reader :stations	

  def initialize(start_station, end_station)
  	@stations = [start_station, end_station]
  end	

  def add_station(interstation)
  	@stations.insert(-2, interstation)
  end
  
  def delete_station(interstation)
    @stations.delete(interstation)
  end
end
