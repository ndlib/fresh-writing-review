FactoryBot.define do
  factory :page do
    sequence(:title) { |n| "Test Page #{n}" }
    sequence(:path) { |n| "page#{n}"}
    sequence(:body) { |n| MarkdownContent.new(content: "Content for page #{n}") }
  end
end
