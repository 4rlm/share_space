class Desk < ApplicationRecord
  belongs_to :space
  has_many :bookings, dependent: :destroy

end
