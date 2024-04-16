class Train_pass < Train 

  def initialize
    super(number, :pass)
  end	

  def add_carriage(carriage)
    if carriage.type == @type
      super
    else
      puts "Different types of train and wagon!"
    end
  end    
end	
