class Admin::IssueForm
  include Virtus.model

  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attribute :title, String
  attribute :year, String
  attribute :large_cover_image, String
  attribute :small_cover_image, String

  validates :title, :year, presence: true

  attr_accessor :issue

  def self.build(controller)
    if controller.params[:id]
      #issue = IssueQuery.find(controller.params[:id])
      issue = Issue.first
    else
      issue = Issue.new
    end

    self.new(issue)
  end


  def initialize(issue, params = {})
    @issue = issue

    if params[:admin_issue_form]
      self.attributes = params[:admin_issue_form]
    else
      self.attributes = @issue.attributes
    end
  end


  def page_title
    if @issue.new_record?
      "New Volume"
    else
      "Edit #{@issue.title}"
    end
  end


  def update
    if valid?
      persist!
      true
    else
      false
    end
  end


  protected

    def perist!
      @issue.attributes = attributes
      @issue.save!
    end


end
