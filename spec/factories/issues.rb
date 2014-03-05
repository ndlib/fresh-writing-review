FactoryGirl.define do
  factory :issue do
    sequence(:year) { |n| Date.today.year - n + 1 }
  end
end
