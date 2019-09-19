class Holidays::User 

    attr_reader :country, :year

    def initialize(country, year)
        @country = country
        @year = year
    end
end