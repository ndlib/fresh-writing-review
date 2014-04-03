class Issue < ActiveRecord::Base
  extend FriendlyId
  friendly_id :year, use: :slugged

  has_many :essays
  has_many :highlighted_essays

  belongs_to :editorial_notes, class_name: "MarkdownContent", dependent: :destroy, foreign_key: "editorial_notes_id"
  belongs_to :editorial_board, class_name: "MarkdownContent", dependent: :destroy, foreign_key: "editorial_board_id"
  belongs_to :acknowledgements, class_name: "MarkdownContent", dependent: :destroy, foreign_key: "acknowledgements_id"

  has_attached_file :old_cover_image, styles: { :large => "731>x731"}
  validates_attachment_content_type :old_cover_image, :content_type => %w(image/jpeg image/jpg image/png)

  has_attached_file :large_cover_image, styles: { :large => "900x200#"}, default_url: '/system/placeholders/large_cover_image_placeholder.gif'
  validates_attachment_content_type :large_cover_image, :content_type => %w(image/jpeg image/jpg image/png)

  has_attached_file :small_cover_image, styles: { :large => "900x90#"}, default_url: '/system/placeholders/small_cover_image_placeholder.gif'
  validates_attachment_content_type :small_cover_image, :content_type => %w(image/jpeg image/jpg image/png)

  has_attached_file :pdf
  validates_attachment_content_type :pdf, :content_type => %w(application/pdf)

  validates_presence_of :year
  validates_uniqueness_of :year


  def add_new_component(component_type, component_value)
    unless self.send "#{component_type}"
      self.send "#{component_type}=", MarkdownContent.new(content: component_value)
      self.save!
      return MarkdownContent.last.id
    end
    return nil
  end


  def is_pdf?
    is_pdf === true
  end
end
