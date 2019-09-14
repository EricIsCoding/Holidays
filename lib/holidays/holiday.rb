class Holidays::Holiday
    attr_accessor :name, :date, :global

    @@all = []

    def self.all
        @@all
    end

    def self.delete_all
        @@all = []
    end

    def initialize(name, date = nil, global = true)
        @name = name
        @date = date
        @global = global
        @@all << self
    end
end