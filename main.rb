require './app'

class Main
    def initialize
        @app = App.new
    end

    def home_menu
        puts "\nWelcome to OOP school Library App!!\n"
        print_menu
    end

    def print_menu
        options
        loop do
        input = user_input
        case input
        when 1 then @app.books_list
        when 2 then @app.people_list
        when 3 then @app.create_person
        when 4 then @app.create_book
        when 5 then @app.create_rental
        when 6 then @app.list_rentals
        else break
        end
        break unless input.positive? && input < 8
    end
end

    def options
        puts "\nPlease choose an option by entering a number:\n"
        puts "1- List all the Books."
        puts "2- List all the people."
        puts "3- create a person."
        puts "4- create a Book."
        puts "5- create a rental."
        puts "6- List all rentals for a given person id."
        puts "7- Exit"

    end

    def user_input
        input = gets.chomp.to_i
        while input > 7 || input < 1
            puts 'Invalid option entered '
            input = gets.chomp.to_i
        end
        input
    end
end

main = Main.new
main.home_menu