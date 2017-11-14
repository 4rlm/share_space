class Amenity < ApplicationRecord
  has_many :space_amenties
  # belongs_to :space #might not need this. Keep an eye on it.

  has_many :space_amenities, dependent: :destroy
  has_many :spaces, through: :space_amenities


end
