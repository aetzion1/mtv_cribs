require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/renter'
require './lib/apartment'
require './lib/building'
require 'pry'

class BuildingTest < Minitest::Test
    def setup
        @building = Building.new
        @unit1 = Apartment.new(
            {
                number: "A1",
                monthly_rent: 1200, 
                bathrooms: 1, 
                bedrooms: 1
            }
        )
        @unit2 = Apartment.new(
            {
                number: "B2",
                monthly_rent: 999, 
                bathrooms: 2, 
                bedrooms: 2
            }
        )
        @unit3 = Apartment.new(
            {
                number: "C3",
                monthly_rent: 1150,
                bathrooms: 2,
                bedrooms: 2
            }
        )
        unit4 = Apartment.new(
            {
                number: "D4",
                monthly_rent: 1500,
                bathrooms: 2,
                bedrooms: 3
            }
        )
        @renter1 = Renter.new("Aurora")
        @renter2 = Renter.new("Tim")
    end

    # Iteration 2

    def test_it_exists
        assert_instance_of Building, @building
    end

    def test_it_has_attributes
        assert_equal [], @building.units
        assert_equal [], @building.renters
    end

    def test_it_can_add_units
        @building.add_unit(@unit1)
        @building.add_unit(@unit2)
        
        assert_equal [@unit1, @unit2], @building.units
        assert_equal [], @building.renters
    end

    def test_it_can_add_renters
        @building.add_unit(@unit1)
        @building.add_unit(@unit2)
        @unit1.add_renter(@renter1)

        assert_equal [@renter1], @building.renters

        @unit2.add_renter(@renter2)

        assert_equal [@renter1, @renter2], @building.renters
    end

    def test_it_can_calculate_avg_rent
        @building.add_unit(@unit1)
        @building.add_unit(@unit2)
        @unit1.add_renter(@renter1)
        @unit2.add_renter(@renter2)

        assert_equal 1099.5, @building.average_rent
    end

    # Iteration 3

    def test_it_can_provide_rented_units
        renter1 = Renter.new("Spencer")
        @building.add_unit(@unit1)
        @building.add_unit(@unit2)
        @building.add_unit(@unit3)

        assert_equal [], @building.rented_units

        @unit2.add_renter(renter1)
        assert_equal [@unit2], @building.rented_units
    end

    def test_it_can_provide_renter_with_highest_rent
        renter1 = Renter.new("Spencer")
        renter2 = Renter.new("Jessie")
        renter3 = Renter.new("Max")
        @building.add_unit(@unit1)
        @building.add_unit(@unit2)
        @building.add_unit(@unit3)
        @unit2.add_renter(renter1)
        binding.pry
        assert_equal renter1, @building.renter_with_highest_rent

        @unit1.add_renter(renter2)
        assert_equal renter2, @building.renter_with_highest_rent
        
        @unit3.add_renter(renter3)
        assert_equal renter3, @building.renter_with_highest_rent
    end

    # def test_it_can_provide_units_by_number_of_bedrooms
    #     renter1 = Renter.new("Spencer")
    #     renter2 = Renter.new("Jessie")
    #     renter3 = Renter.new("Max")
    #     @building.add_unit(@unit1)
    #     @building.add_unit(@unit2)
    #     @building.add_unit(@unit3)
    #     @building.add_unit(unit4)
    #     @building.rented_units
    #     @unit2.add_renter(renter1)
    #     @unit1.add_renter(renter2)
    #     @unit3.add_renter(renter3)

    #     assert_equal [], @building.units_by_number_of_bedrooms
    # end

end