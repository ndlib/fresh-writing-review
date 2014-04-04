class AwardDetail

  include RailsHelpers

  attr_accessor :award, :issue

  delegate :title, to: :award

  def self.build(controller)
    issue = IssueQuery.find(controller.params.require(:issue_id))
    award = AwardQuery.find(controller.params.require(:id))

    self.new(issue, award)
  end


  def initialize(issue, award)
    @award = award
    @issue = issue
  end


  def body
    MarkdownDetail.new(award.body).markdown
  end


  def link_to_detail
    LinkToRouteWithImage.call(routes.issue_award_path(issue.friendly_id, award.friendly_id), award.title, award.cover_image.url(:small))
  end


  def link_to_essay(essay)
    EssayLink.render(essay)
  end


  def has_essays?
    essays.size > 0
  end


  def essays
    @essays ||= EssayQuery.published_essays_for_issue_and_award(issue.friendly_id, award)
  end


  def render_issue_header
    IssueHeader.render(issue, false)
  end
end
