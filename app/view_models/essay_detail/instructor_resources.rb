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


  def has_content?
    markdown_object.present?
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
