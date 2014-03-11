class EssayDetail::Transcript

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
