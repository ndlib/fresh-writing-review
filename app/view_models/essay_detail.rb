class EssayDetail

  include RailsHelpers

  def self.build(controller)
    issue = IssueQuery.find(controller.params[:issue_id])
    essay = EssayQuery.essay_for_issue_from_url(issue, controller.params[:id])

    self.new(essay)
  end

  attr_accessor :essay

  def initialize(essay)
    @essay = essay
  end


  def render_header
    EssayHeader.render(essay)
  end


  def render_works_cited
    if works_cited.present?
      return render_to_string('/essays/works_cited', { object: works_cited })
    end

    ""
  end


  def render_discussion_questions
    if discussion_questions.present?
      return render_to_string('/essays/discussion_questions', { object: discussion_questions })
    end

    ""
  end


  def render_author_biography
    if author_biography.present?
      return render_to_string('/essays/author_biography', { object: author_biography })
    end

    ""
  end


  def render
    display_template.render
  end


  protected

    def display_template
      @template ||= determine_template_class.new(essay)
    end


    def determine_template_class
      if @essay.template == 'text'
        EssayTemplates::Text
      elsif @essay.template == 'media'
        EssayTemplates::Media
      else
        raise "Invalid Template"
      end
    end


    def header
      @header ||= EssayHeader.new(@essay)
    end


    def works_cited
      @works_cited ||= MarkdownDetail.new(@essay.works_cited)
    end


    def discussion_questions
      @discussion_questions ||= MarkdownDetail.new(@essay.discussion_questions)
    end


    def author_biography
      @author_biography ||= AuthorBiographyDetail.new(@essay)
    end
end

