class MarkdownContent < ActiveRecord::Base

  attr_accessor :component_parent, :component_parent_id

  has_many :markdown_content_image
  has_many :images, through: :markdown_content_image

  before_validation :set_content_to_string

  def content_blank?
    content.to_s.strip.blank?
  end

  private

    def set_content_to_string
      self.content ||= ""
    end
end
