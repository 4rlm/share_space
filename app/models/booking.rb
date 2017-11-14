class Booking < ApplicationRecord
  belongs_to :desk
  belongs_to :user

  validate :find_conflicts

  def conflicts?
    desk_bookings = Booking.where(desk_id: self.desk_id)
    conflicts = 0
    desk_bookings.each do |booking|
      if booking.id != self.id
        if
          self.start_date.between?(booking.start_date, booking.end_date) || self.end_date.between?(booking.start_date, booking.end_date) || booking.start_date.between?(self.start_date, self.end_date) || booking.end_date.between?(self.start_date, self.end_date)
          conflicts += 1
        end
      end
    end

    if conflicts > 0
        return true
      else
        return false
      end
  end

  def find_conflicts
    if conflicts?
      errors[:status] << "This booking conflicts with a current booking."
    end
  end



end
