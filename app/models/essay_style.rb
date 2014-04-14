  class EssayStyle < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_many :essays
  has_many :highlighted_essays
  belongs_to :body, class_name: "MarkdownContent", dependent: :destroy, foreign_key: "body_id"

  has_attached_file :cover_image, styles: { small: '211x75#' }, default_url: '/placeholders/essay_style_placeholder.gif'
  validates_attachment_content_type :cover_image, :content_type => %w(image/jpeg image/jpg image/png)
end
