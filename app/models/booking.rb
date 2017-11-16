class Booking < ApplicationRecord
  belongs_to :desk
  belongs_to :user

  attribute :reservation_start_date, :datetime
  attribute :reservation_end_date, :datetime
  validates :desk_id, uniqueness: { scope: :reservation_date }
  # validate :calculate_reservation_days

  def self.create_multiple_bookings(params)
    start_date = params[:reservation_start_date]
    end_date = params[:reservation_end_date]
    desk_id = params[:desk_id]
    user_id = params[:user_id]

    dates = calculate_reservation_days(start_date, end_date)

    begin
      bookings = Booking.transaction do
        dates.map  do |date|
          booking = Booking.new(reservation_date: date, desk_id: desk_id, user_id: user_id).save!
        end
      end
    rescue => e
      bookings =[]
    end

    return bookings

  end

  def self.calculate_reservation_days(start_date, end_date)
    total_reservation_days = (end_date.to_date - start_date.to_date).to_i

    reservation_dates = [start_date.to_date]
    while reservation_dates.count <= total_reservation_days
      date = reservation_dates.last
      reservation_dates << (date + 1.day)
    end
    return reservation_dates
    # binding.pry
  end


  # validate :find_conflicts
  # def conflicts?
  #   desk_bookings = Booking.where(desk_id: self.desk_id)
  #   conflicts = 0
  #   desk_bookings.each do |booking|
  #     if booking.id != self.id
  #       if
  #         self.start_date.between?(booking.start_date, booking.end_date) || self.end_date.between?(booking.start_date, booking.end_date) || booking.start_date.between?(self.start_date, self.end_date) || booking.end_date.between?(self.start_date, self.end_date)
  #         conflicts += 1
  #       end
  #     end
  #   end
  #
  #   if conflicts > 0
  #       return true
  #     else
  #       return false
  #     end
  # end
  #
  # def find_conflicts
  #   if conflicts?
  #     errors[:status] << "This booking conflicts with a current booking."
  #   end
  # end



end
