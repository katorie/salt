class ShiftRequest < ActiveRecord::Base
  belongs_to :member
  validates :member_id, presence: true
  enum slot: %i(morning evening night)

  def slot= value
    if value.kind_of?(String) and value.to_i.to_s == value
      super value.to_i
    else
      super value
    end
  end
end
