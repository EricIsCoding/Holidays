class Holidays::Holiday
    attr_accessor :name, :local_name, :date, :global, :fixed, :launch_year

    @@all = []

    def self.all
        @@all
    end

    def self.delete_all
        @@all = []
    end

    def initialize
        @@all << self
    end
end