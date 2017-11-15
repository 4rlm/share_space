class Address < ApplicationRecord
  belongs_to :space

  def full_address
    [street, city, state, zip].compact.join(',')
  end

  geocoded_by :full_address
  after_validation :geocode
  # after_validation :geocode, if: ->(obj){ obj.full_address.present? and obj.full_address_changed? }

  # def targeted_geocode
  #   if latitude.nil?
  #   end
  # end
  #
  # targeted_geocode


  # binding.pry

  # if :latitude.nil?
  #   # after_validation :geocode, :if => :latitude.nil?
  # end

  # after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }



# addr.fetch_coordinates

end
