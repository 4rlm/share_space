module SpacesHelper

  def self.return_photos_with_same_space_id(space)

    if space.present? && space.photos.present?
      space_photos = space.photos

      verified_space_photos = []
      space_photos.map do |photo|
        verified_space_photos << photo if (photo.present?) && (photo.space_id == space.id)
      end
      verified_space_photos

    end

  end


end

# if @space && @space.photos
# @photos = SpacesHelper.return_photos_with_same_space_id(@space)
