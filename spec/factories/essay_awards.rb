FactoryBot.define do

  factory :essay_award do
    essay { FactoryBot.create(:essay) }
    award { FactoryBot.create(:award) }
    sequence(:placement) { |n| n }
  end
end
