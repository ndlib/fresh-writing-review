class EssayDetail::DiscussionQuestions

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
    if markdown_object.present?
      return render_to_string('/essays/discussion_questions', { object: self })
    end

    ""
  end

  protected

    def markdown_object
      @markdown_object ||= MarkdownDetail.new(essay.discussion_questions)
    end

end
