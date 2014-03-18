if !defined?(STYLES)
  STYLES = %w(Snite McPartlin)
end
FactoryGirl.define do

  factory :essay_award do
    sequence(:title) { |n| STYLES[n%STYLES.length] }
  end
end
