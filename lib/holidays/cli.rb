#This is our CLI controller

class Holidays::CLI

    extend Concerns::Printable

    def initialize
        @year = Date.today.year
    end

    def call
        puts "Welcome to Holidays!"
        puts <<~DOC
        What country are you from? Please use your country's 2 letter country code. (IE: US, CA, GB)
        Find a list of available countries here: http://bit.ly/holidays_countrycodes
        DOC
        get_country
        menu
    end

    def get_country
        @country = gets.strip.upcase
        until Holidays::SupportedCountries.countries.include?(@country)
            puts "Please enter a valid country code from http://bit.ly/holidays_countrycodes:"
            @country = gets.strip.upcase
        end
    end

    def get_year
        @year = gets.strip.to_i
        until @year >= 1900 && @year <= 2100
            puts "Please enter a valid year:"
            @year = gets.strip.to_i
        end
    end

    def menu
        menu_options
        while @input != "exit"
            @input = gets.strip
            case @input
            when "1"
                list_remaining_holidays
                menu_options
            when "2"
                list_all_holidays
                menu_options
            when 'h'
                menu_options
            when 'exit'
               goodbye
            else
                puts "That option is invalid."
            end
        end
    end

    def goodbye
        puts "Thank you. Have a great day!"
        exit
    end

    def menu_options
        menu_options = "Please choose an option from the list below.\n1. List your remaining holidays\n2. List a full year of holidays\nType 'exit' or 'h' at any time to exit or to list the options again.."
        puts <<~DOC
        #{menu_options}
        DOC
    end

    def list_remaining_holidays
        Holidays::API.get_next(@country, @year)
        puts "Your remaining holidays are:\n\n"
        Holidays::CLI.print
        detail_view
    end

    def list_all_holidays
        puts <<~DOC
        Would you like to change your year (#{@year}) or country (#{@country})? y/n
        DOC
        input = gets.strip.downcase
        until input == "y" || input == "n"
            puts "That is not a valid option."
            input = gets.strip.downcase
        end
        case input
        when 'n'
            puts "Holidays for the Year #{@year} in #{@country}.\n\n"
            list_year
        when 'y'
            puts <<~DOC
            What would you like to change?
            1. Year
            2. Country
            3. Both
            DOC
            
            input = gets.strip
            until input == "1" || input == "2" || input == "3"
                puts "Please make a valid selection."
                input = gets.strip
            end
            case input
            when "1"
                puts "What year?"
                get_year
                list_year
            when "2"
                puts "What country?"
                get_country
                list_year
            when "3"
                puts "What year?"
                get_year
                puts "What country?"
                get_country
                list_year
            else

            end
        end
    end

    def list_year
        Holidays::API.get_year(@country, @year)
        Holidays::CLI.print
        detail_view
    end

    def detail_view
        puts "Enter a holiday number for more details, menu to return to the main menu, or exit to exit."
        input = gets.strip
        until input == "menu" || input == "exit"
            index = input.to_i - 1
            if index == nil || index < 0 || index > Holidays::Holiday.all.length
                puts "Please enter valid option."
                input = gets.strip
            else
                puts <<~DOC
                    Holiday Name: #{Holidays::Holiday.all[index].name}
                    Local Name: #{Holidays::Holiday.all[index].local_name}
                    Date: #{Holidays::Holiday.all[index].date}
                    Global: #{Holidays::Holiday.all[index].global}
                    Fixed Date: #{Holidays::Holiday.all[index].fixed}
                    Launch Year: #{Holidays::Holiday.all[index].launch_year}
                - - - - - - - - - - 
                Please make another selection.
                DOC
                input = gets.strip
            end
        end
        if input == "exit"
            goodbye
        else
            menu
        end   
    end
end