class WorkingDays::API
    attr_reader :holidays, :year, :country

    def initialize(year, country)
        @year = year.to_i
        @country = country
    end

    def get_next
        response = HTTParty.get("https://date.nager.at/api/v2/nextpublicholidays/#{@country}")
    end

    def get_year
        response = HTTParty.get("https://date.nager.at/api/v2/publicholidays/#{@year}/#{@country}")
    end
end