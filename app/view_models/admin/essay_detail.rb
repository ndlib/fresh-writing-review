class Admin::EssayDetail
  include RailsHelpers

  attr_accessor :essay


  def self.build(application)
    essay_id = application.request.params[:id]
    mef = Admin::MarkdownEditorFunctions.build(application)
    self.new(mef.mc.essay, mef)
  end


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
