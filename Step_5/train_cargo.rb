require_relative 'train'

class Train_cargo < Train 

  def initialize(number)
    super(number, :cargo)
  end
  
  def add_carriage(carriage)
    if carriage.type == @type
      super
    else
      puts "puts Different types of train and wagon!"
    end 
  end   
end	

