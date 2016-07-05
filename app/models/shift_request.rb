class ShiftRequest < ActiveRecord::Base
  belongs_to :member
  validates :member_id, presence: true
  validates :comment, length: { maximum: 20 }
  enum slot: %i(早番 遅番 泊り 早遅泊)

  default_scope { where(date: Date.today.next_month.all_month).order(:date) }

  def slot= value
    if value.kind_of?(String) and value.to_i.to_s == value
      super value.to_i
    else
      super value
    end
  end

  def self.to_csv(options = {})
    csv_data = CSV.generate(options) do |csv|
      csv << csv_column_names
      all.each do |shift_request|
        csv << shift_request.csv_column_values
      end
    end
    csv_data.encode(Encoding::SJIS)
  end

  def self.csv_column_names
    ['名前', '日付', 'シフト', '開始時間', '終了時間', 'コメント']
  end

  def csv_column_values
    [member.name, date, slot, start_time, end_time, comment]
  end

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      # HEADER = %w(スタッフコード 名前 日付 シフト 開始時刻 終了時刻)
      code = row[0]
      name = row[1]
      date = Date.parse(row[2])
      slot = row[3]
      start_time = row[4]
      end_time = row[5]

      member = Member.find_by(code: code) || Member.find_by(name: name)
      shift_request = member.shift_requests.find_by(date: date)

      if shift_request
        shift_request.update!(slot: slot, start_time: start_time, end_time: end_time)
      else
        if !start_time && !end_time
          case slot
            when '早番'
              start_time = '1000'
              end_time = '1900'
            when '遅番'
              start_time = '1300'
              end_time = '2200'
            when '泊り'
              start_time = '2200'
              end_time = '1000'
            when '早遅泊'
              start_time = '1000'
              end_time = '2200'
          end
        end
        member.shift_requests.create!(date: date, slot:slot, start_time:start_time, end_time: end_time)
      end
    end
  end
end
