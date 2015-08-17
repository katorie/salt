class Member < ActiveRecord::Base
  has_many :shift_requests
end
