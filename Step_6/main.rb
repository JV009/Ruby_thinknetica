require_relative 'train'
require_relative 'train_pass'
require_relative 'train_cargo'
require_relative 'carriage'
require_relative 'carriage_pass'
require_relative 'carriage_cargo'
require_relative 'station'
require_relative 'route'
require_relative 'company'
require_relative 'instance_counter'
require_relative 'valid'

class Interface
  attr_reader :trains, :carriages, :stations, :routes

  def initialize  
    @trains = []
    @carriages = []
    @stations = []
    @routes = []
  end

  def main_menu
    loop do  
      puts "1 - if you want create a train, station, carriage or route"
      puts "2 - if you want add or delete station from a route"
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
        station_operation
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
      begin
        puts "Write the number of train (like: '123-12' or 'aaaaa') or nothing to exit"
        train_number = gets.chomp
        break if train_number == ""
        puts "1 - passenger type"
        puts "2 - cargo type"
        i = gets.chomp.to_i
        if i == 1
          @trains << TrainPass.new(train_number)
        elsif i == 2
          @trains << TrainCargo.new(train_number)
        end
          puts "Train № #{train_number} was created!"
      end
    end
  rescue StandardError => e
    puts e.message
    retry
  end

  def create_station
    loop do
      begin
        puts "Write the name of station (from 2 to 15 characters) or nothing to exit"
        name_station = gets.chomp 
        break if name_station == ""
        @stations << Station.new(name_station)
        puts "Station -#{name_station}- was created!"
      end
    end
  rescue StandardError => e
    puts e.message
    retry
  end
  
  def create_route
    loop do
      begin 
        puts "Write the number of route (from 3 to 20 characters) or nothing to exit"
        route_number = gets.chomp
        break if route_number == ""
        puts "Write the first station"
        start_station = gets.chomp
        puts "Write the last station"
        end_station = gets.chomp
        @routes << Route.new(start_station,end_station, route_number)
        puts "Route № #{route_number} with the first station -#{start_station}- and the last station -#{end_station}- was created!"
      end 
    end
  rescue StandardError => e
    puts e.message
    retry
  end       

  def create_carriage
    loop do
      begin
        puts "Write the number of carriage (5 characters) or nothing to exit"
        carriage_number = gets.chomp
        break if carriage_number == ""
        puts "1 - passenger type"
        puts "2 - cargo type"
        i = gets.chomp.to_i
        if i == 1
          @carriages << CarriagePass.new(carriage_number)
          puts "Carriage № #{carriage_number} was created!"
        elsif i == 2
          @carriages << CarriageCargo.new(carriage_number)
          puts "Carriage № #{carriage_number} was created!"
        end
      end
    end
  rescue StandardError => e
    puts e.message
    retry 
  end

  def station_operation
    puts "Write the number of route"
    route_number = gets.chomp
    puts "Write the name of station"
    name_station = gets.chomp
    puts "1 - add station"
    puts "2 - delete station"
    i = gets.chomp.to_i
    if i == 1
      @routes.each do |route|
        route.add_station(@stations.find { |st| st.name_station == name_station }) if route.number_route == route_number
      end
    elsif i == 2
      @routes.each do |route|
        route.delete_station(@stations.find { |st| st.name_station == name_station }) if route.number_route == route_number
      end
    end
  end

  def route_operation
    puts "Write the number of route"
    route_number = gets.chomp
    puts "Write the number of train"
    train_number = gets.chomp
    @trains.each do |train|
      train.add_route(@routes.find { |route| route.number_route == route_number }) if train.number == train_number
    end
  end

  def carriages_operation
    puts "Write the number of carriage"
    carriage_number = gets.chomp
    puts "Write the number of train to add carriage"
    train_number = gets.chomp
    puts "1 - add carriage"
    puts "2 - delete carriage"
    i = gets.chomp.to_i
    if i == 1 
      @trains.each do |train|
        train.add_carriage(@carriages.find{ |carriage| carriage.number == carriage_number }) if train.number == train_number
      end
    elsif i == 2
      @trains.each do |train|
        train.delete_carriage(@carriages.find{ |carriage| carriage.number == carriage_number }) if train.number == train_number
      end
    end
  end

   def train_operation
    puts "Write the number of train"
    train_number = gets.chomp
    puts "1 - move next"
    puts "2 - move back"
    i = gets.chomp.to_i
    if i == 1
      move_next
    elsif i == 2
      move_previous
    end
  end

  def move_next
    puts "Write the number of train"
    train_number = gets.chomp
    if @trains[train_number].route.nil?
      puts "This train without a route!"
      return
    end
    @trains[train_number].next
    puts "Train № #{@trains[train_number].number}' move on the next station"
  end

  def move_previous
    puts "Write the number of train"
    train_number = gets.chomp
    if @trains[train_number].route.nil?
      puts "This train without a route!"
      return
    end
    @trains[train_number].back
    puts "Train № #{@trains[train_number].number}' move on the previous station"
  end

  def show_stations
    @stations.each { |station| puts "Station - #{station.name_station}" }
  end

  def show_trains
    puts "write the name of station"
    name_station = gets.chomp
    @stations.each { |station| station.trains.each { |train| puts "Train - № #{train.number}"} if station.name_station == name_station }
  end
end