
class Essay < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :issue
  belongs_to :essay_style
  belongs_to :essay_award

  has_many :essay_files
  has_many :attached_files,  through: :essay_files

  validates :title, presence: true

  store :data, accessors: [ :body, :embed, :template, :alt_body, :alt_title, :author, :author_biography, :works_cited, :discussion_questions ]
end
