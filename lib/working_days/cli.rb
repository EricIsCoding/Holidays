#This is our CLI controller

class WorkingDays::CLI

    attr_reader :year, :country

    def initialize
    end

    def call
        puts "Welcome to Working Days!"
        get_holidays
        menu
    end

    def get_holidays
        puts <<~DOC
        Before we begin, I will need a bit of information from you.
        What year is it? (ex. 2019)
        DOC
        @year = gets.strip
        puts "What country are you from? Please use your country's 2 letter country code. (IE: US, CA, UK)"
        @country = gets.strip
        puts "It is #{@year}, and you are from #{@country}."
    end

    def menu
        puts <<~DOC
        What would you like to do? Choose from the list below.
        1. List all public holidays.
        2. Calculate work days.
        DOC
        input = gets.strip
        case input
        when "1"
            puts "Here are your holidays"
            # list_holidays
        when "2"
            # calculate_work_days
            puts "You work [number of working days] more days this year."
        else
            puts "That option is invalid."
            menu
        end
    end
end