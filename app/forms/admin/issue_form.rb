class Admin::IssueForm
  include Virtus.model

  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attribute :title, String
  attribute :year, String

  validates :title, :year, presence: true

  attr_accessor :issue

  def self.build(controller)
    if controller.params[:id]
      issue = IssueQuery.find(controller.params[:id])
    else
      issue = Issue.new
    end

    self.new(issue, controller.params[:admin_issue_form])
  end


  def initialize(issue, params = {})
    @issue = issue

    if params
      self.attributes = params
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


  def save!
    if valid? && persist
      true
    else
      false
    end
  end


  protected

    def persist
      @issue.attributes = attributes

      if !@issue.valid?
        @issue.errors.each do | key, value |
          self.errors[key] << value
        end

        return false
      end

      @issue.save!
      CopyPreviousIssuePages.call(@issue)
    end

end
