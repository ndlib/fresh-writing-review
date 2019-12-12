FactoryBot.define do

  factory :issue do
    sequence(:year) { |n| Date.today.year - n + 1 }
    editorial_notes { |i| MarkdownContent.new(content: "Notes for #{i.year}") }
    editorial_board { |i| MarkdownContent.new(content: "Editorial Board for #{i.year}") }
    acknowledgements { |i| MarkdownContent.new(content: "Acknowledgements for #{i.year}") }
    published { true }
  end


  factory :unpublished_issue, class: Issue do
    sequence(:year) { |n| Date.today.year + n + 1 }
    editorial_notes { |i| MarkdownContent.new(content: "Notes for #{i.year}") }
    editorial_board { |i| MarkdownContent.new(content: "Editorial Board for #{i.year}") }
    acknowledgements { |i| MarkdownContent.new(content: "Acknowledgements for #{i.year}") }
    published { false }
  end
end
