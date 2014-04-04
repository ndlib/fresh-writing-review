if !defined?(STYLES)
  STYLES = %w(Snite McPartlin)
end
FactoryGirl.define do

  factory :award do
    sequence(:title) { |n| STYLES[n%STYLES.length] }
  end
end
