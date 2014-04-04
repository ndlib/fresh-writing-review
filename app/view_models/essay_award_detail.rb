class EssayAwardDetail

  include RailsHelpers

  attr_accessor :essay_award, :issue

  delegate :title, to: :essay_award

  def self.build(controller)
    issue = IssueQuery.find(controller.params.require(:issue_id))
    essay_award = EssayAwardQuery.find(controller.params.require(:id))

    self.new(issue, essay_award)
  end


  def initialize(issue, essay_award)
    @essay_award = essay_award
    @issue = issue
  end


  def body
    MarkdownDetail.new(essay_award.body).markdown
  end


  def link_to_detail
    LinkToRouteWithImage.call(routes.issue_essay_award_path(issue.friendly_id, essay_award.friendly_id), essay_award.title, essay_award.cover_image.url(:small))
  end


  def link_to_essay(essay)
    EssayLink.render(essay)
  end


  def has_essays?
    essays.size > 0
  end


  def essays
    @essays ||= EssayQuery.published_essays_for_issue_and_essay_award(issue.friendly_id, essay_award)
  end


  def render_issue_header
    IssueHeader.render(issue, false)
  end
end
