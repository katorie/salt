class Member < ActiveRecord::Base
  has_many :shift_requests
  accepts_nested_attributes_for :shift_requests, reject_if: proc {|attributes| attributes['slot'].nil? && attributes['comment'].blank? }, allow_destroy: true
  validates :name, presence: true
  validates :code, presence: true, uniqueness: true
end
