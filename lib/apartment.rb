require './lib/renter'

class Apartment

    attr_reader :number, 
    :monthly_rent, 
    :bathrooms, 
    :bedrooms

    attr_accessor :renter

    def initialize (apt_hash)
        @number = apt_hash[:number]
        @monthly_rent = apt_hash[:monthly_rent]
        @bathrooms = apt_hash[:bathrooms]
        @bedrooms = apt_hash[:bedrooms]
        @renter = nil
    end

    def add_renter(renter)
        @renter = renter
    end

end