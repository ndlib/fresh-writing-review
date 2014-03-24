class Essay < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :issue
  belongs_to :essay_style
  belongs_to :essay_award

  belongs_to :body, class_name: "MarkdownContent", dependent: :destroy, foreign_key: "body_id"
  belongs_to :alt_body, class_name: "MarkdownContent", dependent: :destroy, foreign_key: "alt_body_id"
  belongs_to :author_biography, class_name: "MarkdownContent", dependent: :destroy, foreign_key: "author_biography_id"
  belongs_to :works_cited, class_name: "MarkdownContent", dependent: :destroy, foreign_key: "works_cited_id"
  belongs_to :discussion_questions, class_name: "MarkdownContent", dependent: :destroy, foreign_key: "discussion_questions_id"
  belongs_to :instructor_resources, class_name: "MarkdownContent", dependent: :destroy, foreign_key: "instructor_resources_id"

  has_many :essay_files
  has_many :attached_files, through: :essay_files

  validates :title, presence: true

  store :data, accessors: [ :embed, :template, :alt_title, :author ]
end
