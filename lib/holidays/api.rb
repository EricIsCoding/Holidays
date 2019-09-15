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
            new_holiday = Holidays::Holiday.new
            new_holiday.name = holiday["name"]
            new_holiday.local_name = holiday["localName"]
            new_holiday.date = holiday["date"]
            new_holiday.global = holiday["global"]
            new_holiday.fixed = holiday["fixed"]
            new_holiday.launch_year = holiday["launchYear"] 
        end
    end
end