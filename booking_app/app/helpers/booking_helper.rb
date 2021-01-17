module BookingHelper
	def format_date_time(datetime)
    return datetime.strftime("%Y-%m-%d") if not datetime.blank?
  end

  def format_status(str)
  	if str == true
  		return 'Success'
  	else
  		return 'Failure'
  	end
  end
end
