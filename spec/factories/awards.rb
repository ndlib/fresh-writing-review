if !defined?(STYLES)
  STYLES = %w(Snite McPartlin)
end
FactoryBot.define do

  factory :award do
    sequence(:title) { |n| STYLES[n%STYLES.length] }
  end
end
