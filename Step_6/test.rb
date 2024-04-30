  def create_trains
    train_number = ""
    loop do
      puts "Write the number of train (like: '123-12' or 'aaaaa') or nothing to exit"
      number_train = gets.chomp
      break if train_number == ""
        begin
          puts "1 - passenger type"
          puts "2 - cargo type"
          i = gets.chomp.to_i
        end until i == 1 || i == 2

        if i == 1
          @trains << Train_pass.new(train_number)
        else
          @trains << Train_cargo.new(train_number)
        end
      end
    end
  end
  rescue => e
    puts e.message
    retry
  end

#before
    def create_train
    loop do
      puts "Write the number of train (like: '123-12' or 'aaaaa') or nothing to exit"
      train_number = gets.chomp
      break if train_number == 0
      begin
        puts "1 - passenger type"
        puts "2 - cargo type"
        i = gets.chomp.to_i
      end until i == 1 || i == 2
        if i == 1
          @trains << Train_pass.new(train_number)
        else
          @trains << Train_cargo.new(train_number)
        end
      end
    end
  rescue StandardError => e
    puts e.message
    retry
  end
