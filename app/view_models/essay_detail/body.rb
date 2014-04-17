class EssayDetail::Body

  include RailsHelpers

  attr_accessor :essay

  def self.render(essay)
    self.new(essay).render
  end


  def initialize(essay)
    @essay = essay
  end


  def has_content?
    markdown_object.present?
  end


  def markdown
    markdown_object.markdown
  end


  def render
    if has_content?
      return render_to_string('/essays/body', { object: self })
    else
      ""
    end
  end

  protected

    def markdown_object
      @markdown_object ||= MarkdownDetail.new(essay.body)
    end
end
