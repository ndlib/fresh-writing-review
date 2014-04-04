FactoryGirl.define do

  factory :essay_award do
    essay { FactoryGirl.create(:essay) }
    award { FactoryGirl.create(:award) }
    sequence(:placement) { |n| n }
  end
end
