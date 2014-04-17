class EssayDetail::Transcript

  include RailsHelpers

  attr_accessor :essay

  def self.render(essay)
    self.new(essay).render
  end


  def initialize(essay)
    @essay = essay
  end


  def back_to_essay_link
    helpers.link_to("Back to Essay", routes.issue_essay_path(essay.issue, essay), class: "tool-link back")
  end


  def has_content?
    markdown_object.present?
  end


  def markdown
    markdown_object.markdown
  end


  def render
    if display_body?
      return render_to_string('/essays/transcript', { object: self })
    end

    ""
  end

  protected

    def display_body?
      essay_format.media? && markdown_object.present?
    end


    def markdown_object
      @markdown_object ||= MarkdownDetail.new(essay.alt_body)
    end


    def essay_format
      @essay_format ||= EssayFormat.new(essay)
    end
end
