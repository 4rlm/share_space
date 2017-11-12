class Space < ApplicationRecord
  belongs_to :user
  has_one :address, dependent: :destroy

  # has_many :photos, dependent: :destroy
  has_many :photos

  has_many :desks, dependent: :destroy
  has_many :space_amenities, dependent: :destroy
  has_many :amenities, through: :space_amenities
  has_many :bookings, through: :desks, dependent: :destroy



end
