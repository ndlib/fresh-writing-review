class HighlightedEssay < ActiveRecord::Base
  store :data, accessors: [ :body, :biography ]

  belongs_to :issue
  belongs_to :essay_style
  belongs_to :essay

  validates_presence_of :essay

  delegate :title, :friendly_id, :author, to: :essay


  def essay_style
    essay.essay_style.title
  end
end
