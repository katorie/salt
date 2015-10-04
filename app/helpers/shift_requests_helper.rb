module ShiftRequestsHelper
  def weekend?(day)
    day.wday == 0 || day.wday == 6
  end
end
