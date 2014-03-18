
class EssayAwardDetail

  include RailsHelpers

  attr_accessor :essay_award, :issue

  def initialize(issue, essay_award)
    @essay_award = essay_award
    @issue = issue
  end

  def link_to_detail
    LinkToRouteWithImage.call(routes.issue_essay_award_path(issue.friendly_id, essay_award.friendly_id), essay_award.title, essay_award.id)
  end


  def has_essays?
    true
  end
end
