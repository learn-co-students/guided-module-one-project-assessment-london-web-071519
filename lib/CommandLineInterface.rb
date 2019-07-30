class CommandLineInterface 

    old_logger = ActiveRecord::Base.logger
    ActiveRecord::Base.logger = nil
    #To turn it back on:

    #ActiveRecord::Base.logger = old_logger


    def greet
        puts 'Welcome to Football Fan Masters, the best resource for football players information in the world!'
    end


    def show_favorite_players(user) #this method is backend finding the players of a specifc fan
        fan1 = Fan.find_by(name: user)
        players_array = fan1.players
        players_array.each do |player|
            puts player.name 
        end
    end


    def view_fav_players_of_another_fan #this method displays the favorite players of a specific fan to the CLI
        require "tty-prompt"
        prompt = TTY::Prompt.new

        puts "Great, you want to see who a specifc fan's favorite players are :)."
                fan_you_want = prompt.ask('Please type in the name of the fan whose favorite players you want to see: ', required: true)
                while Fan.find_by(name: fan_you_want) == nil
                    puts "\nSorry we didn't recognize that username."
                    fan_you_want = prompt.ask("Please try again. Type in the name of the fan username: ", required: true)
                end
                puts "\n#{fan_you_want}\'s favorite player(s):"   
                show_favorite_players(fan_you_want) 
    end
    

    def show_fans(player) #this method is backend finding the fans of a specifc player
        player1 = Player.find_by(name: player)
        fans_array = player1.fans
        fans_array.each do |fan|
            puts fan.name 
        end
    end

    def choose_specific_player
        require "tty-prompt"
        prompt = TTY::Prompt.new
        player_you_want = prompt.ask('Please type in the name of the player you want: ', required: true)
                while Player.find_by(name: player_you_want) == nil
                    puts "Sorry we didn't recognize that username."
                    player_you_want = prompt.ask("Please try again. Type in the name of the player: ", required: true)
                end
            player_you_want
    end


    def all_fans_of_specific_player #this method displays the fans of a specific player to the CLI
        puts "\nSo you want to see the fans of a specific player :). Awesome, which player would you like to see the fans for?"
        chosen_player = choose_specific_player
        puts "\n#{chosen_player}\'s fans:"
                show_fans(chosen_player)
    end

    def option_select #this method provides the selection functionality of the app. The user can choose from several options. 
        require "tty-prompt"
        prompt = TTY::Prompt.new

        puts "\n \n"

        prompt.select("What would you like to do? Choose from the options below:") do |menu|
            menu.choice 'View my favorite players'
            menu.choice 'View all fans of a specifc player'
            menu.choice 'View favorite players of another fan'
            menu.choice 'View total market value of the starting 11 players'
            menu.choice 'Add a new favorite player to my account'
            menu.choice 'Delete a favorite player from my account'
            menu.choice 'I just got a season ticket. Update my club season ticket status.'
            menu.choice 'exit'
          end

    end

    def total_market_value_of_starting_11
        sum = 0
        Player.where(starter: true).map do |player|
           player_value = player.market_value.split(/£/)
           player_value = player_value[1].to_i
           sum += player_value
        end
       
        sum = sum.to_s
        sum = "£" + sum
        puts "\nThe total market value of the 11 starting players on the team is #{sum}"
    end

    def create_new_favorite_player_for_user(user)
        require "tty-prompt"
        prompt = TTY::Prompt.new

        puts "\nHere's a list of the players:"
        Player.all.each do |player|
            puts player.name
        end
        puts "\n"
        chosen_player = choose_specific_player
        player_to_use = Player.find_by(name: chosen_player)
        fan_to_use = Fan.find_by(name: user)
        puts player_to_use.id
        puts fan_to_use.id
        if PlayerFan.find_by(player_id: player_to_use.id, fan_id: fan_to_use.id) == nil
            PlayerFan.create(player_id: player_to_use.id, fan_id: fan_to_use.id)
            puts "#{chosen_player} was added to your favorite players :)"
        else
            puts "This is already one of your favorite players :)"
        end
    end


    def run

        playerfan1 = PlayerFan.create(player_id: 7, fan_id: 11)
        puts playerfan1

        require "tty-prompt"
        prompt = TTY::Prompt.new

        greet
        user = prompt.ask('Please type in your fan username to get started or type exit to quit app: ', required: true)
        if user == "exit"
            exit
        else
            while Fan.find_by(name: user) == nil
            puts "\nSorry we didn't recognize that username."
            user = prompt.ask("Please try again. Type in your fan username to get started: ", required: true)
            end
        end
        
        #user has successfully logged in
        puts "Thanks for logging in :)"


        user_option_choice = option_select

          while user_option_choice != 'exit'

            if user_option_choice == 'View my favorite players'
                puts "\nYour favorite player(s):"
                show_favorite_players(user) 
            elsif user_option_choice == 'View all fans of a specifc player'
                all_fans_of_specific_player
            elsif user_option_choice == 'View favorite players of another fan'
                view_fav_players_of_another_fan
            elsif user_option_choice == 'View total market value of the starting 11 players'
                total_market_value_of_starting_11
            elsif user_option_choice == 'Add a new favorite player to my account'
                create_new_favorite_player_for_user(user)
            elsif user_option_choice == 'Delete a favorite player from my account'
                puts "Nick still needs to build this one: fan user can delete a favorite player"
            elsif user_option_choice == 'I just got a season ticket. Update my club season ticket status.'
                puts "Nick still needs to build this one: update season ticket status"
            end
        
            sleep(1.5)

            user_option_choice = option_select
        end 

    
    end
   
        
end
    
