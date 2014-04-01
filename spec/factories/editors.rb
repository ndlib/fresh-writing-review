FactoryGirl.define do
  factory :editor do
    user { FactoryGirl.create(:user) }
  end
end
