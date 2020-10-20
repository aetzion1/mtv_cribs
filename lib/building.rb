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

    def average_rent
        total_rent = 0
        @units.each do |unit|
            total_rent += unit.monthly_rent
        end
        total_rent / @units.count.to_f
    end

    def rented_units
        @units.select do |unit|
            unit.renter != nil
        end
    end

    def renter_with_highest_rent
        # UNIT WITH IGHEST
        rented_units = @units.select do |unit|
            unit.renter != nil
        end

        highest_rent = rented_units.max_by do |unit|
            unit.monthly_rent
        end
        highest_rent.renter
    end
        
end