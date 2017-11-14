class Booking < ApplicationRecord
  belongs_to :desk
  belongs_to :user

  def all_dates
    # (params[:booking_date][:end].to_date - params[:booking_date][:start].to_date).to_i
  end

end
