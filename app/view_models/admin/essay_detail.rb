class Admin::EssayDetail
  include RailsHelpers

  attr_accessor :essay


  def self.build(application)
    mef = Admin::MarkdownEditorFunctions.build(application)
    self.new(mef.mc.essay, mef)
  end

  attr_reader :essay

  delegate :published?, :issue, to: :essay

  def initialize(essay, mef=nil)
    @mef = mef
    @essay = essay
  end


  def edit_content_link(content_type)
    @mef.essay_content_link(content_type)
  end


  def edit_content_status(content_type)
    @mef.essay_content_status(content_type)
  end

  def public_link
    if published?
      link_text = "View Essay"
    else
      link_text = "Preview Essay"
    end
    helpers.link_to(link_text, routes.issue_essay_path(essay.issue, essay))
  end

  def files
    if essay.attached_file
      [essay.attached_file]
    else
      []
    end
  end

  def essay_award
    essay.essay_award
  end


  def components
    {
      :body => 'Body Content',
      :alt_body => 'Alternate Body',
      :author_biography => 'Author Biography',
      :works_cited => 'Works Cited',
      :discussion_questions => 'Discussion Questions',
      :instructor_resources => 'Instructor Resources'
    }
  end

  def volume_link
    helpers.link_to(volume_title, routes.admin_issue_path(essay.issue))
  end

  def volume_title
    @essay.issue.title
  end


  def essay_title
    @essay.title
  end


  def essay_author
    @essay.author
  end


  def essay_style
    @essay.essay_style.title
  end


end
