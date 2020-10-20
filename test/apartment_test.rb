require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/renter'
require '.lib/apartment'
require 'pry'

class ApartmentTest < Minitest::Test
    def setup
        @renter1 = Renter.new("Jessie")
        @unit1 = Apartment.new(
            {
                number: "A1",
                monthly_rent: 1200, 
                bathrooms: 1, 
                bedrooms: 1
            })
    end
    
    # Iteration 1

    def test_it_exists
        assert_instance_of Apartment, @unit1
    end

    def test_it_has_attributes
        assert_equal "A1", renter1.number
        assert_equal 1200, renter1.monthly_rent
        assert_equal 1, renter1.bathrooms
        assert_equal 1, renter1.bedrooms
        assert_equal nil, renter1.renter
    end

    def test_it_can_add_renter
        @unit1.add_renter(@renter1)

        assert_equal @renter1, unit1.renter
    end