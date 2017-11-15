class Photo < ApplicationRecord
  belongs_to :user
  # belongs_to :space

  has_attached_file :image,
  styles: { thumb: ["400x250#", :jpg], original: ['400x250>', :jpg] },
  convert_options: { thumb: "-quality 75 -strip", original: "-quality 85 -strip" }

  # has_attached_file :image, url: "/system/:hash.:extension", hash_secret: "abc123"

  validates_attachment :image, presence: true,
  content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] },
  size: { in: 0..500.kilobytes }

end
