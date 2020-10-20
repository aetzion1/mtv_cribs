require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/renter'
require 'pry'

class RenterTest < Minitest::Test
    def setup
        @renter1 = Renter.new("Jessie")
    end
    
    # Iteration 1

    def test_it_exists
        assert_instance_of Renter, @renter1
    end

    def test_it_has_attributes
        assert_equal "Jessie", @renter1.name
    end

end