require './lib/renter'

class Apartment

    attr_reader :number,
    :monthly:rent,
    :bathrooms,
    :bedrooms

    def initialize (apt_hash)
        @number = apt_hash[:number]
        @monthly_rent = apt_hash[:monthly_rent]
        @bathrooms = apt_hash[:bathrooms]
        @bedrooms = apt_hash[:bedrooms]
    end

    def 