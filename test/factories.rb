FactoryGirl.define do
  factory :member do
    sequence(:name) {|n| "Member #{n}"}
  end
end
