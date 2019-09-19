class Holidays::Holiday
    attr_accessor :name, :local_name, :date, :global, :fixed, :launch_year

    @@all = []

    def self.all
        @@all
    end

    def self.delete_all
        @@all = []
    end

    def initialize(name, date, global)
        @name = name
        @date = date
        @global = global
        @@all << self
    end
end