class Issue < ActiveRecord::Base
  extend FriendlyId
  friendly_id :year, use: :slugged

  has_many :essays
  has_many :highlighted_essays

  belongs_to :editorial_notes, class_name: "MarkdownContent", dependent: :destroy, foreign_key: "editorial_notes_id"
  belongs_to :editorial_board, class_name: "MarkdownContent", dependent: :destroy, foreign_key: "editorial_board_id"
  belongs_to :acknowledgements, class_name: "MarkdownContent", dependent: :destroy, foreign_key: "acknowledgements_id"

  store :data, accessors: [ :title, :cover_image_fixture_path, :is_pdf, :published ]

  validates_presence_of :year
  validates_uniqueness_of :year

  def is_pdf?
    is_pdf === true
  end
end
