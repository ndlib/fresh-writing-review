class Admin::EssayForm
  include Virtus.model

  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attribute :title, String
  attribute :author, String
  attribute :essay_style_id, Integer

  attr_accessor :essay, :issue

  validates :title, :author, :essay_style_id, presence: true

  def self.build(controller)
    if controller.params[:id]
      essay = EssayQuery.find(controller.params[:id])
    else
      essay = Essay.new
    end

    issue = IssueQuery.find(controller.params[:issue_id])

    self.new(essay, issue, controller.params)
  end


  def initialize(essay, issue, params = {})
    @essay = essay
    @issue = issue

    if params[:admin_essay_form]
      self.attributes = params[:admin_essay_form]
    else
      self.attributes = essay.attributes
    end
  end


  def page_title
    if essay.new_record?
      "New Essay"
    else
      "Edit #{essay.title}"
    end
  end


  def essay_style_options
    EssayStyleQuery.all.collect { | es | [ es.title, es.id] }
  end


  def save!
    if valid?
      persist!
      true
    else
      false
    end
  end


  private

    def persist!
      essay.attributes = attributes
      essay.issue = issue
      essay.save!
    end
end
