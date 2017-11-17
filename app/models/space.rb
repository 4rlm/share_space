class Space < ApplicationRecord
  belongs_to :user
  has_one :profile, through: :user
  has_one :address, dependent: :destroy
  # has_many :photos, dependent: :destroy
  has_many :photos, through: :user
  has_many :desks, dependent: :destroy
  has_many :space_amenities, dependent: :destroy
  has_many :amenities, through: :space_amenities
  has_many :bookings, through: :desks, dependent: :destroy

  # SEARCH WITH PG SEARCH GEM
  include PgSearch
  pg_search_scope :search_any_word, against: [:name, :description, :website, :phone],
  using: {tsearch: {dictionary: "english", any_word: :true}},
  associated_against: {
    address: [:street, :city, :state, :zip],
    amenities: :name,
    desks: [:price, :description],
    profile: [:first_name, :last_name, :phone],
    user: :username
  }

  def self.text_search(query)
    if query.present?
      search_any_word(query)
    else
      where(nil)
    end
  end

end
