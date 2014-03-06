FactoryGirl.define do
  factory :essay do
    issue { FactoryGirl.create(:issue) }
  end
end
