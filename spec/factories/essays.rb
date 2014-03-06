FactoryGirl.define do
  factory :essay do
    issue { FactoryGirl.create(:issue) }
    title "title goes here"
  end
end
