class HighlightedEssay < ActiveRecord::Base
  store :data, accessors: [ :body, :biography ]

  belongs_to :issue
  belongs_to :essay_style
  belongs_to :essay
end
