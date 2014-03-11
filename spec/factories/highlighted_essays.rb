FactoryGirl.define do
  factory :highlighted_essay do
    essay { FactoryGirl.create(:essay) }
    issue { |f| f.essay.issue }
    essay_style { |f| f.essay.essay_style }
  end
end
