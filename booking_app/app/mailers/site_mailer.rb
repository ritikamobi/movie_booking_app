class SiteMailer < ActionMailer::Base
  default from: "Booking.Co <ritikamobi@gmail.com>"
  def booking_confirmation(booking_hash)
    @booking_hash = booking_hash
    subject = "Ticket Booking Confirmation"
    mail(to: booking_hash[:user_email], subject: subject) 
  end
    
end