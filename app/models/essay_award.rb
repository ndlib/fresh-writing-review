class EssayAward < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_many :essay
  belongs_to :body, class_name: "MarkdownContent", dependent: :destroy, foreign_key: "body_id"

end
