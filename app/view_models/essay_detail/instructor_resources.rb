class EssayDetail::InstructorResources

  include RailsHelpers

  attr_accessor :essay

  def self.render(essay)
    self.new(essay).render
  end


  def initialize(essay)
    @essay = essay
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


  protected

    def markdown_object
      @markdown_object ||= MarkdownDetail.new(essay.instructor_resources)
    end

end
