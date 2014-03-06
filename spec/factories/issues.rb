FactoryGirl.define do
  factory :issue do
    sequence(:year) { |n| Date.today.year - n + 1 }
    editorial_notes { |i| "Notes for #{i.year}" }
    editorial_board { |i| "Editorial Board for #{i.year}" }
    acknowledgments { |i| "Acknowledgments for #{i.year}" }
  end
end
