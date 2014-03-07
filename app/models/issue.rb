class Issue < ActiveRecord::Base
  extend FriendlyId
  friendly_id :year, use: :slugged

  has_many :essays

  store :data, accessors: [ :editorial_notes, :editorial_board, :acknowledgments, :cover_image_fixture_path ]

  validates_presence_of :year
  validates_uniqueness_of :year
end
