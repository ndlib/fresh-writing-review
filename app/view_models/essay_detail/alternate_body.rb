class EssayDetail::AlternateBody

  include RailsHelpers

  attr_accessor :essay

  def self.render(essay)
    self.new(essay).render
  end


  def initialize(essay)
    @essay = essay
  end


  def title
    essay.alt_title
  end


  def display_title?()
    title.present?
  end


  def markdown
    markdown_object.markdown
  end


  def render
    if display_alt_body?
      return render_to_string('/essays/alternate_body', { object: self })
    end

    ""
  end

  protected

    def display_alt_body?
      markdown_object.present? && essay_format.text?
    end


    def markdown_object
      @markdown_object ||= MarkdownDetail.new(essay.alt_body)
    end


    def essay_format
      @essay_format ||= EssayFormat.new(essay)
    end
end
