module MembersHelper
  def applied_next_month?(member)
    search_date = Date.today.next_month.all_month
    member.shift_requests.find_by(date: search_date).nil?
  end
end
