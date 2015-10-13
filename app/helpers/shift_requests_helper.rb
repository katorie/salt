module ShiftRequestsHelper
  def holiday?(day)
    day.wday == 0 || day.wday == 6 || @national_holidays.any? {|d| d.date == day }
  end
end
