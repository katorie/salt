class Member < ActiveRecord::Base
  has_many :shift_requests
  accepts_nested_attributes_for :shift_requests
  validates :name, presence: true
end
