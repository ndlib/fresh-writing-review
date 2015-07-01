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
    helpers.link_to(link_text, routes.issue_essay_path(essay.issue, essay), class: 'btn btn-default', target: 'blank')
  end


  def image_form
    @form ||= Admin::EssayImageForm.new(essay)
  end


  def files
    essay.attached_files
  end

  def essay_award
    essay.essay_award
  end

  def highlighted?
    essay.highlighted_essay.present?
  end


  def components
    {
      :body => 'Essay Body',
      :author_biography => 'Author Biography',
      :works_cited => 'Works Cited',
      :discussion_questions => 'Discussion Questions',
      :embed => 'Embedded Multimedia',
      :alt_body => 'Media Transcript',
      :instructor_resources => 'Instructor Resources',
      :wowza_media => 'Wowza Media'
    }
  end

  def components_with_content
    @components_with_content ||= components.reject{|k,v| content_blank?(k)}
  end

  def components_without_content
    @components_without_content ||= components.reject{|k,v| !content_blank?(k)}
  end

  def content_blank?(content_type)
    @mef.content_blank?(content_type)
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
