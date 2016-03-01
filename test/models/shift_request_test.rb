require 'test_helper'

class ShiftRequestTest < ActiveSupport::TestCase
  setup do
    @shift_request = FactoryGirl.create(:shift_request)
  end
  test "shift_request should belongs to a member" do
    assert @shift_request.valid?
  end

  test "comment should be maximum 20" do
    @shift_request.comment = "a" * 21
    assert @shift_request.invalid?
    assert_raises(ActiveRecord::RecordInvalid) { @shift_request.save!}
  end

  test "slot is only 4 patterns" do
    assert_raises(ArgumentError) { @shift_request.slot = 4 }
  end

  test "CSV file is encoding Shift-JIS" do
    ShiftRequest.delete_all
    member = FactoryGirl.create(:member)
    member.shift_requests.create!(
      date: Date.today,
      slot: 0,
      comment: "がんばります",
      start_time: "1000",
      end_time: "1500"
    )
    csv = ShiftRequest.to_csv
    assert_equal "Windows-31J", csv.encoding.to_s
  end
end
