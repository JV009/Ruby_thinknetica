require_relative 'train'
require_relative 'train_pass'
require_relative 'train_cargo'
require_relative 'carriage'
require_relative 'carriage_pass'
require_relative 'carriage_cargo'
require_relative 'station'
require_relative 'route'

class Interface
  attr_reader :train, :carriages, :statation, :route

  def initialize  
    @trains = []
    @carriages = []
    @stations = []
    @routes = []
  end

  def main_menu
    loop do  
      puts "1 - if you want create a train, station, carriage or route"
      puts "2 - if you want add or delete station"
      puts "3 - if you want appoint route"
      puts "4 - if you want add or delete carriage"
      puts "5 - if you want change station at the train"
      puts "6 - to show all stations"
      puts "7 - to show all trains on the station"
      puts "8 - to exit"
      i = gets.chomp.to_i
      case i
      when 1
        creating
      when 2
        stations_operation
      when 3
        route_operation
      when 4
        carriages_operation
      when 5
        train_operation
      when 6
        show_stations
      when 7
        show_trains
      when 8
        break
      end
    end
  end  

  def creating_menu
    puts "1 - to create the train"
    puts "2 - to create the station"
    puts "3 - to create the route"
    puts "4 - to create the carriage"
    puts "5 - go back"
  end
  
  def creating
    loop do
      creating_menu
      i = gets.chomp.to_i
      case i
      when 1 
        create_train
      when 2
        create_station
      when 3
        create_route
      when 4
        create_carriage
      when 5 
        main_menu
      end
    end
  end

  def create_train
    loop do
      puts "Write the number of train or nothing to exit"
      train_number = gets.chomp.to_i
      break if train_number == 0
      puts "1 - passenger type"
      puts "2 - cargo type"
      i = gets.chomp.to_i
      until i == 1 || i == 2
        if i == 1
          @trains << Train_pass.new(train_number)
        else
          @trains << Train_cargo.new(train_number)
        end
      end
    end
  end

  def create_station
    loop do
      puts "Write the name of station or nothing to exit"
      name_station = gets.chomp 
      break if name_station == ""
      @stations << Station.new(name_station)
    end
  end
  
  def create_route
    loop do 
      puts "Write the number of route or nothing to exit"
      route_number = gets.chomp.to_i
      break if route_number == 0
      puts "Write the first station"
      start_station = gets.chomp
      puts "Write the last station"
      end_station = gets.chomp
      @routes << Route.new(start_station,end_station)
    end
  end       

  def create_carriage
    loop do
      puts "Write the number of carriage or nothing to exit"
      carriage_number = gets.chomp.to_i
      break if carriage_number == 0
      puts "1 - passenger type"
      puts "2 - cargo type"
      i = gets.chomp.to_i
      until i == 1 || i == 2
        if i == 1
          @carriages << Carriage_pass.new(carriage_number)
        else
          @carriages << Carriage_cargo.new(carriage_number)
        end
      end
    end
  end

  def station_operation
    puts "Write the name of station"
    name_station = gets.chomp
    puts "Write the number of route"
    route_number = gets.chomp.to_i
    puts "1 - add station"
    puts "2 - delete station"
    i = gets.chomp.to_i
    if i == 1
      route.add_station(name_station, route_number)
    else
      route.delete_station(name_station, route_number)
    end
  end

  def route_operation
    puts "write the number of route"
    route_number = gets.chomp.to_i
    puts "Write the number of train"
    train_number = gets.chomp.to_i
    trains.each do |train|
      train.routes(routes.find { |route| routes.route_number == route_number }) if trains.number == train_number    
    end
  end

  def carriages_operation
    puts "Write the number of carriage"
    carriage_number = gets.chomp.to_i
    puts "1 - add carriage"
    puts "2 - delete carriage"
    i = gets.chomp.to_i
    if i == 1 
      train.each do |train|
        train.add_carriage(carriages.find{ |carriage| carriages.number == carriage_number }) if train.number == train_number
      end
    else
      train.each do |train|
        train.delete_carriage(carriages.find{ |carriage| carriages.number == carriage_number }) if train.number == train_number
      end
    end
  end

  def train_operation
    puts "Write the number of train"
    train_number = gets.chomp.to_i
    puts "1 - move next"
    puts "2 - move back"
    i = gets.chomp.to_i
    if i == 1
      trains.each { |train| train.next_station if train.number == train_number }
    else
      trains.each { |train| train.previous_station if train.number == train_number }
    end
  end

  def show_stations
    stations.each { |station| puts "Станция - #{station.name}" }
  end

  def show_trains
    puts "write the name of station"
    name_station = gets.chomp
    stations.each { |station| station.trains.each { |train| puts "Поезд - №#{train.number}"} if station.name_station == name_station }
  end
end