class Page < ActiveRecord::Base
  extend FriendlyId
  friendly_id :path, use: :slugged

  belongs_to :body, class_name: "MarkdownContent", dependent: :destroy, foreign_key: "content_id"

end
