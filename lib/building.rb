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
        renter_array = @units.map do |unit|
            unit.renter
        end
        renter_array.compact
    end

end