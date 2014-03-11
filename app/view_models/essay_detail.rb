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
    EssayDetail::Header.render(essay)
  end


  def render_works_cited
    EssayDetail::WorksCited.render(essay)
  end


  def render_discussion_questions
    EssayDetail::DiscussionQuestions.render(essay)
  end


  def render_author_biography
    EssayDetail::AuthorBiography.render(@essay)
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
        EssayDetail::Text
      elsif @essay.template == 'media'
        EssayDetail::Media
      else
        raise "Invalid Template"
      end
    end


    def discussion_questions
      @discussion_questions ||= MarkdownDetail.new(@essay.discussion_questions)
    end

end

