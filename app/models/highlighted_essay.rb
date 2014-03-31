class HighlightedEssay < ActiveRecord::Base

  belongs_to :issue
  belongs_to :essay_style
  belongs_to :essay

  validates_presence_of :essay

  delegate :title, :friendly_id, :author, to: :essay

end
