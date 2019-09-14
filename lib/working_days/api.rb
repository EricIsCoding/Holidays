class WorkingDays::API

    def self.get_next(country)
        parse(HTTParty.get("https://date.nager.at/api/v2/nextpublicholidays/#{country}"))
    end

    def self.get_year(country, year)
        parse(HTTParty.get("https://date.nager.at/api/v2/publicholidays/#{year}/#{country}"))
    end

    def self.parse(response)
        @repsonse.each do |holiday|
            WorkingDays::Holiay.new(holiday["name"], holiday["date"], holiday["global"])
        end
    end
end