class Admin::IssueDetail
  include RailsHelpers

  attr_reader :issue

  delegate :title, :published?, to: :issue


  def self.build(application)
    mef = Admin::MarkdownEditorFunctions.build(application)
    self.new(mef.mc.issue, mef)
  end


  def initialize(issue, mef=nil)
    @mef = mef
    @issue = issue
  end

  def public_link
    if published?
      link_text = "View Issue"
    else
      link_text = "Preview Issue"
    end
    helpers.link_to(link_text, routes.issue_path(issue.friendly_id))
  end


  def edit_content_link(content_type)
    @mef.issue_content_link(content_type)
  end


  def edit_content_status(content_type)
    @mef.issue_content_status(content_type)
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
    helpers.link_to('Edit', routes.edit_admin_issue_path(@issue.id), class: 'btn btn-primary')
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
    @issue.essays
  end

end
