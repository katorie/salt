class ShiftRequest < ActiveRecord::Base
  belongs_to :member
  enum slot: %i(早番 遅番 泊り)
end
