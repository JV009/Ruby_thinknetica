class Route
  attr_reader :stations, :route_number	

  def initialize(start_station, end_station)
    @stations = [start_station, end_station]
  end	

  def add_station(interstation, route_number)
    @stations.insert(-2, interstation)
  end
  
  def delete_station(interstation, route_number)
    @stations.delete(interstation)
  end
end
