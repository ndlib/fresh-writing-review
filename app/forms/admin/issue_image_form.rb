class Admin::IssueImageForm
  include Virtus.model
  include RailsHelpers

  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attr_accessor :issue

  attribute :large_cover_image, String
  attribute :small_cover_image, String
  attribute :cover_image_credit, String
  attribute :cover_image_alt, String


  def self.build(controller)
    issue = IssueQuery.find(controller.params[:id])
    self.new(issue, controller.params[:admin_issue_image_form])
  end


  def initialize(issue, params = {})
    @issue = issue

    if params.size > 0
      attributes = params
    else
      self.cover_image_credit = issue.cover_image_credit
      self.cover_image_alt = issue.cover_image_alt
    end
  end


  def large_image
    helpers.image_tag issue.large_cover_image(:large)
  end


  def small_image
    helpers.image_tag issue.small_cover_image(:large)
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
      issue.attributes = attributes
      issue.save!
    end
end
