FactoryGirl.define do
  factory :essay do
    issue { FactoryGirl.create(:issue) }
    essay_style { FactoryGirl.create(:essay_style) }
    sequence(:title) { |n| "Test Essay #{n}" }
  end
end
