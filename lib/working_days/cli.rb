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
    end
end