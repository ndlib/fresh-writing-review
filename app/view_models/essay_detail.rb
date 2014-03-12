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


  def transcript_link
    if essay_format.media?
      "<div class=\"transcript\">#{helpers.link_to('Transcript', routes.transcript_issue_essay_path(essay.issue.friendly_id, essay.friendly_id))}</div>"
    end
  end


  def render_header
    EssayDetail::Header.render(essay)
  end


  def render_embed
    EssayDetail::Embed.render(essay)
  end


  def render_body
    EssayDetail::Body.render(essay)
  end


  def render_alternate_body
    EssayDetail::AlternateBody.render(essay)
  end


  def render_transcript
    EssayDetail::Transcript.render(essay)
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


  protected


    def essay_format
      @essay_format ||= EssayFormat.new(essay)
    end

end

