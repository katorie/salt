class ShiftRequest < ActiveRecord::Base
  belongs_to :member
  validates :member_id, presence: true
  enum slot: %i(早番 遅番 泊り)
end
