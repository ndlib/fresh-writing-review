
class Essay < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :issue
  belongs_to :essay_style
  belongs_to :essay_award

  has_many :essay_files
  has_many :attached_files,  through: :essay_files

  validates :title, presence: true

  store :data, accessors: [ :body, :embed, :template, :alt_body, :alt_title, :author, :author_biography, :works_cited, :discussion_questions, :instructor_resources ]

  searchable do
    text :title, :body_plain, :alt_body_plain, :discussion_questions_plain, :instructor_resources_plain

    string :sort_title
  end

  def body_plain
    stripdown(body)
  end

  def alt_body_plain
    stripdown(alt_body)
  end

  def discussion_questions_plain
    stripdown(discussion_questions)
  end

  def instructor_resources_plain
    stripdown(instructor_resources)
  end

  def sort_title
    title.downcase.gsub(/^(an?|the) /, '').strip
  end

  private

    def stripdown(markdown)
      if markdown.is_a?(MarkdownContent)
        text = markdown.content
      else
        text = markdown
      end
      StripDownConverter.call(text)
    end
end
