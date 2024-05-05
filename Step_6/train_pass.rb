require_relative 'train'

class TrainPass < Train 

  def initialize(number)
    @type = :pass
    super
  end	

  def add_carriage(carriage)
    if carriage.type == @type
      super
    else
      puts "Different types of train and wagon!"
    end
  end    
end	
