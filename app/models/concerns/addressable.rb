module Addressable
  extend ActiveSupport::Concern

  included do
    geocoded_by :address
    reverse_geocoded_by :latitude, :longitude
    
    after_validation :geocode

    def address
      [street, city, state, country].compact.join(', ')
    end
  end
end
