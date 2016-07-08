class Member < ActiveRecord::Base
  has_many :shift_requests
  accepts_nested_attributes_for :shift_requests, reject_if: proc {|attributes| attributes['slot'].nil? && attributes['comment'].blank? }, allow_destroy: true
  validates :name, presence: true
  validates :code, presence: true, uniqueness: true

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      # HEADER = %w(スタッフコード 名前)
      code = row[0]
      name = row[1]

      member = Member.find_by(code: code) || Member.find_by(name: name)

      if member
        member.update!(code: code, name: name)
      else
        Member.create!(code: code, name: name)
      end
    end
  end
end
