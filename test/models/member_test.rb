require 'test_helper'

class MemberTest < ActiveSupport::TestCase
  test "Name is valid" do
    member = FactoryGirl.create(:member)
    assert member.valid?
  end

  test "Blank name is invalid" do
    member = Member.new(name: ' ')
    assert member.invalid?
  end

  test "Name should be uniqueness" do
    member = FactoryGirl.create(:member)
    member2 = member.dup
    assert member2.invalid?
  end
end
