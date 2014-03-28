class UploadImageForm
  include Virtus.model
  include RailsHelpers

  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations


  attribute :image, String

  def self.render(image)
    self.new(image).render
  end


  def initialize(image)

  end


  def current_image

  end


  def present?

  end


  def render
    render_to_string('/admin/images/form', { object: self })
  end


end
