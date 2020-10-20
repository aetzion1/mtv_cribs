require './lib/renter'
require './lib/apartment'

class Building
    
    attr_accessor :units

    def initialize (units = [])
        @units = units
    end

    def add_unit(unit)
        @units << unit
    end

    def renters
        @units.select do |unit|
            unit.renter
        end
    end

end