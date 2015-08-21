class Member < ActiveRecord::Base
  has_many :shift_requests
  accepts_nested_attributes_for :shift_requests, reject_if: proc {|attributes| attributes['slot'].nil? && attributes['comment'].blank? }
  validates :name, presence: true
end
