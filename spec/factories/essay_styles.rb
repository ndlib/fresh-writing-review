if !defined?(STYLES)
  STYLES = %w(Narrative Analysis Research Definition Rebuttal Reflective)
end
FactoryGirl.define do

  factory :essay_style do
    sequence(:title) { |n| STYLES[n%STYLES.length] }
    slug { |s| s.title.downcase }
  end
end
