FactoryBot.define do
  factory :essay do
    issue { FactoryBot.create(:issue) }
    essay_style { FactoryBot.create(:essay_style) }
    sequence(:title) { |n| "Test Essay #{n}" }
    published { true }
  end
end
