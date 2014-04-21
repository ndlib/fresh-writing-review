class Admin::IssueImageForm
  include Virtus.model
  include RailsHelpers

  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attr_accessor :issue

  attr_accessor :cover_image_alt, :cover_image_credit, :large_cover_image, :small_cover_image

  def self.build(controller)
    issue = IssueQuery.find(controller.params[:id])
    self.new(issue, controller.params[:admin_issue_image_form])
  end


  def initialize(issue, params = {})
    @issue = issue

    if params.size > 0
      if params[:large_cover_image]
        self.large_cover_image = params[:large_cover_image]
      end
      if params[:small_cover_image]
        self.small_cover_image = params[:small_cover_image]
      end

      self.cover_image_credit = params[:cover_image_credit]
      self.cover_image_alt = params[:cover_image_alt]
    else
      self.cover_image_credit = issue.cover_image_credit
      self.cover_image_alt = issue.cover_image_alt
    end
  end


  def large_image
    if issue.large_cover_image.present?
      helpers.image_tag issue.large_cover_image(:large)
    else
      helpers.image_tag '/placeholders/admin_large_cover_image_placeholder.gif'
    end
  end


  def small_image
    if issue.small_cover_image.present?
      helpers.image_tag issue.small_cover_image(:large)
    else
      helpers.image_tag '/placeholders/admin_large_cover_image_placeholder.gif'
    end
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
      if large_cover_image
        issue.large_cover_image = large_cover_image
      end
      if small_cover_image
        issue.small_cover_image = small_cover_image
      end

      issue.cover_image_credit = cover_image_credit
      issue.cover_image_alt = cover_image_alt

      issue.save!
    end
end
