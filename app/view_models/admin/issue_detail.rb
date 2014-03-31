class Admin::IssueDetail
  include RailsHelpers

  attr_accessor :issue

  delegate :title, to: :issue


  def self.build(controller)
    self.new
  end


  def initialize(issue)
    @issue = issue
  end


  def edit_button
    helpers.link_to('Edit', routes.edit_admin_issue_path(issue), class: 'btn btn-primary')
  end


  def published_ui

  end


  def issue_essay_button

  end


  def essays

  end


end
