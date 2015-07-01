class EssayDetail

  include RailsHelpers

  def self.build(controller)
    essay = EssayQuery.essay_for_issue_from_url(controller.params[:issue_id], controller.params[:id])

    self.new(essay)
  end


  attr_accessor :essay, :issue

  def initialize(essay)
    @essay = essay
    @issue = essay.issue
  end


  def render_issue_header
    IssueHeader.render(essay.issue, false)
  end


  def render_header
    EssayDetail::Header.render(essay)
  end


  def render_nav
    EssayDetail::Nav.render(essay)
  end


  def render_companion_material
    EssayDetail::CompanionMaterial.render(essay)
  end

  def render_embed
    EssayDetail::Embed.render(essay)
  end

  def render_wowza_media
    EssayDetail::WowzaMedia.render(essay)
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
    EssayDetail::AuthorBiography.render(essay)
  end


  def render_instructor_resources
    EssayDetail::InstructorResources.render(essay)
  end


  protected

end

