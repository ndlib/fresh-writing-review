class Essay < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_paper_trail

  belongs_to :issue
  belongs_to :essay_style
  has_one :essay_award, dependent: :destroy
  has_one :award, through: :essay_award

  belongs_to :body, class_name: "MarkdownContent", dependent: :destroy, foreign_key: "body_id"
  belongs_to :alt_body, class_name: "MarkdownContent", dependent: :destroy, foreign_key: "alt_body_id"
  belongs_to :author_biography, class_name: "MarkdownContent", dependent: :destroy, foreign_key: "author_biography_id"
  belongs_to :works_cited, class_name: "MarkdownContent", dependent: :destroy, foreign_key: "works_cited_id"
  belongs_to :discussion_questions, class_name: "MarkdownContent", dependent: :destroy, foreign_key: "discussion_questions_id"
  belongs_to :instructor_resources, class_name: "MarkdownContent", dependent: :destroy, foreign_key: "instructor_resources_id"
  belongs_to :embed, class_name: "MarkdownContent", dependent: :destroy, foreign_key: "embed_id"

  has_one :highlighted_essay, dependent: :destroy

  has_one :attached_file

  validates :title, presence: true

  has_attached_file :cover_image, styles: { large: "671x429#", small: '211x135#', highlight: '348x223#', tiny: '78x50#' }, default_url: '/placeholders/essay_cover_image_placeholder.gif'
  validates_attachment_content_type :cover_image, :content_type => %w(image/jpeg image/jpg image/png)

  has_attached_file :author_image, styles: { small: '140x113#' }, default_url: '/placeholders/author_placeholder.jpg'
  validates_attachment_content_type :cover_image, :content_type => %w(image/jpeg image/jpg image/png)


  searchable do
    text :title, :author, :body_plain, :alt_body_plain, :discussion_questions_plain, :instructor_resources_plain, :author_biography_plain

    string :sort_title
    string :essay_style_title
    string :issue_year
    string :medium
    boolean :published do
      issue_and_essay_published?
    end
  end


  def add_new_component(component_type, component_value)
    unless self.send "#{component_type}"
      self.send "#{component_type}=", MarkdownContent.new(content: component_value)
      self.save!
      return MarkdownContent.last.id
    end
    return nil
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

  def author_biography_plain
    stripdown(author_biography)
  end

  def sort_title
    title.downcase.gsub(/^(an?|the) /, '').strip
  end

  def essay_style_title
    if essay_style.present?
      essay_style.title
    else
      nil
    end
  end

  def issue_year
    if issue.present?
      issue.year
    else
      nil
    end
  end

  def medium
    if published_medium == 'video'
      "Video Essay"
    elsif published_medium == 'audio'
      "Audio Essay"
    else
      "Traditional"
    end
  end

  def issue_published?
    issue.present? && issue.published?
  end

  def issue_and_essay_published?
    published? && issue_published?
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
