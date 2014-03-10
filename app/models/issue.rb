class Issue < ActiveRecord::Base
  extend FriendlyId
  friendly_id :year, use: :slugged

  has_many :essays

  store :data, accessors: [ :title, :editorial_notes, :editorial_board, :acknowledgments, :cover_image_fixture_path, :is_pdf ]

  validates_presence_of :year
  validates_uniqueness_of :year

  def is_pdf?
    is_pdf === true
  end
end
