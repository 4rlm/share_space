class Amenity < ApplicationRecord
  has_many :space_amenties
  # belongs_to :space #might not need this. Keep an eye on it.


end
