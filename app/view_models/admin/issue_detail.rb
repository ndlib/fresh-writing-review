class Admin::IssueDetail
  include RailsHelpers

  attr_accessor :issue

  delegate :title, to: :issue


  def initialize(application)
    issue_id = application.request.params[:id]
    @mef = Admin::MarkdownEditorFunctions.build(application)
    @issue = @mef.mc.issue
  end


  def volume_title
    @issue.title
  end


  def issue_id
    @issue.id
  end


  def components
    {
      :acknowledgements => 'Acknowledgements',
      :editorial_notes => 'Note From the Editor',
      :editorial_board => 'Editorial Board'
    }
  end


  def edit_button
    helpers.link_to('Edit', routes.edit_admin_issue_path(@issue), class: 'btn btn-primary')
  end


  def show_link(issue)

  end


  def published_ui

  end


  def issue_essay_button

  end


  def essays
    @issue.essays
  end


end
