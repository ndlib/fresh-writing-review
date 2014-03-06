FactoryGirl.define do
  STYLES = %w(Narrative Analysis Research Definition Rebuttal Reflective)
  factory :essay_style do
    sequence(:title) { |n| STYLES[n] }
    slug { |s| s.title.downcase }
  end
end
