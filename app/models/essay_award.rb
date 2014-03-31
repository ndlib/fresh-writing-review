class EssayAward < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_many :essay
  belongs_to :body, class_name: "MarkdownContent", dependent: :destroy, foreign_key: "body_id"


  def add_new_component(component_type, component_value)
    unless self.send "#{component_type}"
      self.send "#{component_type}=", MarkdownContent.new(content: component_value)
      self.save!
      return MarkdownContent.last.id
    end
    return nil
  end

end
