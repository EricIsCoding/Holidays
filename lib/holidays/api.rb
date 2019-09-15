class Holidays::API

    def self.get_next(country, year)
        response = HTTParty.get("https://date.nager.at/api/v2/nextpublicholidays/#{country}")
        response = response.find_all do |holiday| 
            date = holiday["date"].split("-")
            year == date[0].to_i
        end
        parse(response)
    end

    def self.get_year(country, year)
        parse(HTTParty.get("https://date.nager.at/api/v2/publicholidays/#{year}/#{country}"))
    end

    def self.parse(response)
        Holidays::Holiday.delete_all
        response.each do |holiday|
            Holidays::Holiday.new(holiday["name"], holiday["date"], holiday["global"])
        end
    end
end