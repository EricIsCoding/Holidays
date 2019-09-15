module Concerns::Printable
    def print
        Holidays::Holiday.all.each.with_index(1) do |holiday, index|
        puts "      #{index}. #{holiday.name} #{holiday.date}"
        end
    end
end