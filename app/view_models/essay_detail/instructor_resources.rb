class EssayDetail::InstructorResources

  include RailsHelpers

  attr_accessor :essay

  def self.render(essay)
    self.new(essay).render
  end


  def initialize(essay)
    @essay = essay
  end


  def link_to_detail(css = "")
    if has_content?
      helpers.link_to('Instructor Resources', routes.instructor_resources_issue_essay_path(@essay.issue.friendly_id, @essay.friendly_id), class: css)
    end
  end


  def markdown
    markdown_object.markdown
  end


  def to_html
    markdown_object.to_html
  end


  def has_content?
    has_markdown_content? || has_files?
  end

  def has_markdown_content?
    markdown_object.present?
  end

  def files
    essay.instructor_resources_files
  end

  def has_files?
    files.present?
  end

  def decorated_files
    EssayDetail::DownloadFile.decorate_collection(files)
  end


  def render
    return render_to_string('/essays/instructor_resources', { object: self })
  end


  def back_to_essay_link
    helpers.link_to("Back to Essay", routes.issue_essay_path(essay.issue, essay), class: "tool-link back")
  end


  protected

    def markdown_object
      @markdown_object ||= MarkdownDetail.new(essay.instructor_resources)
    end

end
