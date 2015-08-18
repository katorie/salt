class Member < ActiveRecord::Base
  has_many :shift_requests, dependent: :destroy
  validates :name, presence: true
end
