require './lib/renter'
require './lib/apartment'

class Building
    
    attr_reader :units, :renters

    def initialize (units, renters)
        @units = []
        @renters = []
    end

    def add_unit(unit)
        @units << unit
    end

    def add_renter(renter)
        @renters << renter
    end

end