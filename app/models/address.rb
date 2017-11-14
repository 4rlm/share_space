class Address < ApplicationRecord
  belongs_to :space

  def full_address
    [street, city, state, zip].compact.join(',')
  end

  geocoded_by :full_address
  after_validation :geocode
  # after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }
  # after_validation :geocode, :if => :full_address_changed?



# addr.fetch_coordinates

end
