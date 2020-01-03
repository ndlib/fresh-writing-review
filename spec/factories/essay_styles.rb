if !defined?(STYLES)
  STYLES = %w(Narrative Analysis Research Definition Rebuttal Reflective)
end
FactoryBot.define do

  factory :essay_style do
    sequence(:title) { |n| STYLES[n%STYLES.length] }
  end
end
