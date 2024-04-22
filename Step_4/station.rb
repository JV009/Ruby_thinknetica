class Station
  attr_reader :trains

  def initialize(name_station)
    @name_station = name_station
    @trains = []
  end
  
  def get_train(train)
    @trains << train
  end
  
  def send_train(train)
    @trains.delete(train)
  end
  
  def type_trains
    @type = {cargo:0, pass:0}
    @trains.each do |train|
      @type[train.type] += 1
    end  
  end            
end  

