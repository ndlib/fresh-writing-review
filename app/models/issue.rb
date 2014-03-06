class Issue < ActiveRecord::Base
  extend FriendlyId
  friendly_id :year, use: :slugged
  store :data, accessors: [ :editorial_notes, :editorial_board, :acknowledgments ]

  validates_presence_of :year
  validates_uniqueness_of :year
end
