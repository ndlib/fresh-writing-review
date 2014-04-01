class Admin::IssueDetail
  include RailsHelpers

  attr_accessor :issue

  delegate :title, to: :issue


  def self.build(controller)
    issue = IssueQuery.find(controller.params[:id])
    self.new(issue)
  end


  def initialize(issue)
    @issue = issue
  end


  def edit_button
    helpers.link_to('Edit', routes.edit_admin_issue_path(issue.id), class: 'btn btn-primary')
  end


  def issue_status
    if issue.published?
      "<span class=\"glyphicon glyphicon-eye-open\"></span> Published"
    else
      "<span class=\"glyphicon glyphicon-eye-close\"></span> Unpublished"
    end
  end


  def file_icon
    if issue.is_pdf?
      "<span class=\"pdf glyphicon glyphicon-file\" title=\"PDF Only\"></span>"
    end
  end


  def show_link(issue)

  end


  def published_ui

  end


  def issue_essay_button

  end


  def essays

  end


end
