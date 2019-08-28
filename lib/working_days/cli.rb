#This is our CLI controller

class WorkingDays::CLI

    def initialize
    end

    def call
        puts <<~DOC
        Welcome to Working Days!
        Before we begin, I will need a bit of information from you.
        DOC
        
    end
end