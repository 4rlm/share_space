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
      errors[:base] << "This booking conflicts with a current booking."
    end
  end


# Booking 1                        self
# id:1
# start_date: 11-18-2017
# end_date: 01-04-2018
# desk_id:13
# user_id:12

# Booking 2                     booking
# id:4
# start_date: 11-28-2017
# end_date: 12-30-2017
# desk_id: 13
# user_id: 8

# Booking 3                         test
# id:
# start_date: 2018-3-14
# end_date:   2018-3-19
# desk_id: 13
# user_id: 9

end
