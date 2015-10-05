FactoryGirl.define do
  factory :member do
    sequence(:name) {|n| "Member #{n}"}
  end

  factory :shift_request do |f|
    f.date { Date.today }
    f.slot 0
    f.comment { "がんばります" }
    f.start_time { "1000" }
    f.end_time { "1500" }
    f.member_id 1
  end
end
