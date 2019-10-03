class User < ActiveRecord::Base
    has_many :characters
    has_many :choices, through: :characters
    has_many :games
    has_many :fights, through: :choices
    has_many :monsters, through: :fights
    
    @@prompt = TTY::Prompt.new
    

    def self.create_user
        new_username = @@prompt.ask("What username would you like to have?")
        while new_username == "" || new_username == nil || User.find_by(username: new_username)
            new_username = @@prompt.ask("Sorry-- Invalid username or name already taken. What username would you like to have?")

        end
        User.create(username: new_username, wins: 0, losses: 0)
    end

    def self.find_user
        returning_username = @@prompt.ask("What is your username?")
        while returning_username == "" || returning_username == nil
            returning_username = @@prompt.ask("Sorry-- Invalid username. What is your username?")
        end
        user_found = self.find_by(username: returning_username)
        if user_found == nil
           new_user = @@prompt.yes?("I'm sorry, we can't find your username. Would you like to create a new username?")
           if new_user == true
            new_user = self.create_user
            Character.create_character(new_user)
            user_found = new_user
           else
            puts "See you later"
            exit
           end
        else
            puts "Welcome back, #{user_found.username}."
        end
        user_found
    end

    def view_profile
        puts "Your username is #{self.username}."
        puts "You have won #{self.wins} times."
        puts "You have lost #{self.losses} times."
    end

    def update_user(game)
        change_name = @@prompt.ask("What would you like your new username to be?")
        self.update(username: change_name)
        puts "Your username is now #{change_name}"
        game.menu
    end

    def delete_user
        delete = @@prompt.yes?("Are you sure you want to delete your user?")
        if delete == true
            self.delete
            system "clear"
            GameRunner.new.run
        end
    end

    def list_characters
        self.characters
    end

end