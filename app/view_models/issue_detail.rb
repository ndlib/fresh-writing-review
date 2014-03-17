class IssueDetail
  include RailsHelpers

  def self.build(controller)
    issue = IssueQuery.find(controller.params.require(:id))

    self.new(issue)
  end

  def self.current
    issue = IssueQuery.current

    self.new(issue)
  end

  delegate :friendly_id, :title, :year, :is_pdf?, to: :issue
  attr_accessor :issue

  def initialize(issue)
    @issue = issue
  end

  def link_to_show
    helpers.link_to(year, routes.issue_path(friendly_id))
  end

  def render_nav
    issue_nav.render
  end

  def cover_image
    helpers.image_tag("covers/#{year}.jpg")
  end

  def issue_nav
    @issue_nav ||= IssueNav.new(issue)
  end

  def render_carousel
    highlighted_essay_carousel.render
  end

  def highlighted_essay_carousel
    @highlighted_essay_carousel ||= HighlightedEssayCarousel.new(issue)
  end

  def editorial_notes
    MarkDownConverter.call(issue.editorial_notes)
  end

  def editorial_board
    MarkDownConverter.call(issue.editorial_board)
  end

  def acknowledgments
    MarkDownConverter.call(issue.acknowledgments)
  end


  def essays
    EssayQuery.essays_for_issue(issue).collect { | e | EssayLink.new(e) }
  end

  def render_issue_header
    IssueHeader.render(issue, true)
  end
end
