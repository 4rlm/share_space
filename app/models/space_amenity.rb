class SpaceAmenity < ApplicationRecord
  belongs_to :amenity
  belongs_to :space

  validates_uniqueness_of :amenity, scope: :space_id
end
