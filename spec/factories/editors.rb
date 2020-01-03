FactoryBot.define do
  factory :editor do
    user { FactoryBot.create(:user) }
  end
end
