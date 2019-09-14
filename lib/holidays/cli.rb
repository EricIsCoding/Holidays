#This is our CLI controller

class Holidays::CLI

    def initialize
    end

    def call
        puts "Welcome to Working Days!"
        get_user_info
        menu
    end

    def get_user_info
        puts <<~DOC
        Before we begin, I will need a bit of information from you.
        What year is it? (1900 - 2100)
        DOC
        year = gets.strip.to_i
        until year >= 1900 && year <= 2100
            puts "Please enter a valid year."
            year = gets.strip.to_i
        end
        puts <<~DOC
        What country are you from? Please use your country's 2 letter country code. (IE: US, CA, UK)
        Find a list of available countries here: http://bit.ly/api_countrycodes
        DOC
        country = gets.strip
    end

    def menu
        puts <<~DOC
        What would you like to do? Choose a number from the list below. Type 'exit' to exit and 'h' to see the list again.
        1. List Your Remaining Holidays
        2. List Other Holidays
        DOC
        while @input != "exit"
            @input = gets.strip
            case @input
            when "1"
                list_remaining_holidays
            when "2"
                list_other_holidays
            when 'h'
                puts <<~DOC
                Please choose an option from the list below.
                1. List all public holidays.
                2. Calculate work days.
                DOC
            when 'exit'
                puts "Thank you, have a great day!"
                break
            else
                puts "That option is invalid."
            end
        end
    end

    def list_remaining_holidays
    end

    def list
    end
end