class Admin::EssayImageForm
  include Virtus.model
  include RailsHelpers

  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attr_accessor :essay
  attr_accessor :cover_image_alt, :cover_image_credit, :cover_image


  def self.build(controller)
    essay = EssayQuery.find(controller.params[:id])
    self.new(essay, controller.params[:admin_essay_image_form])
  end


  def initialize(essay, params = {})
    @essay = essay
    if params.size > 0
      if params[:cover_image]
        self.cover_image = params[:cover_image]
      end

      self.cover_image_credit = params[:cover_image_credit]
      self.cover_image_alt = params[:cover_image_alt]
    else
      self.cover_image_credit = essay.cover_image_credit
      self.cover_image_alt = essay.cover_image_alt
    end
  end


  def essay_cover_image
    helpers.image_tag essay.cover_image(:large)
  end


  def add_images!
    if valid?
      persist!
      true
    else
      false
    end
  end


  private

    def persist!
      if cover_image
        essay.cover_image = cover_image
      end

      essay.cover_image_credit = cover_image_credit
      essay.cover_image_alt = cover_image_alt

      essay.save!
    end

end
