class Holidays::API

    def self.get_next(country, year)
        @next_parsed ||= HTTParty.get("https://date.nager.at/api/v2/nextpublicholidays/#{country}")
        @next_response ||= @next_parsed.find_all do |holiday|
            date = holiday["date"].split("-")
            year == date[0].to_i
        end
        make_holidays(@next_response)
    end

    def self.get_year(country, year)
        make_holidays(HTTParty.get("https://date.nager.at/api/v2/publicholidays/#{year}/#{country}"))
    end

    def self.make_holidays(response)
        Holidays::Holiday.delete_all
        response.each do |holiday|
            new_holiday = Holidays::Holiday.new(holiday["name"], holiday["date"], holiday["global"])
            new_holiday.local_name = holiday["localName"] || "N/A"
            new_holiday.fixed = holiday["fixed"] || "N/A"
            new_holiday.launch_year = holiday["launchYear"] || "N/A"
        end
    end
end