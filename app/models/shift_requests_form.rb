class ShiftRequestsForm
  include Virtus.model
  include ActiveModel::Model

  attribute :member, Member
  attribute :year, Integer
  attribute :month, Integer
  attribute :shift_requests, Array[ShiftRequest]

  def initialize(args)
    super
    # TODO: ユーザから入力値が与えられていない場合はすでに入力済みのこの年月を対象とした shift_requests を DB から取得 (更新用にフォームに現在値を入れておく用)
    shift_requests = Date.new(year, month).all_month.map do |date|
      member.shift_requests.where(date: Date.new(year, month).all_month).find { |request| request.date == date } || member.shift_requests.build(date: date)
    end
  end

  def save
    return false unless valid?
    persist!
  end

  private

  def persist!
    # TODO: 入力値に応じて ShiftRequest オブジェクトを create, update, destroy する
    # 成功したら true を。失敗したら例外を。
  end
end
