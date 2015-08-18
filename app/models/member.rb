class Member < ActiveRecord::Base
  has_many :shift_requests
  validates :name, presence: true
end
