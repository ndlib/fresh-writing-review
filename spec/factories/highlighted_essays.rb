FactoryBot.define do
  factory :highlighted_essay do
    essay { FactoryBot.create(:essay) }
    issue { |f| f.essay.issue }
    essay_style { |f| f.essay.essay_style }
  end
end
