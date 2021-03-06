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

  def link_to_show(css = "")
    helpers.link_to(title, routes.issue_path(friendly_id), class: css)
  end

  def render_nav
    issue_nav.render
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
    issue.editorial_notes.content
  end

  def editorial_board
    issue.editorial_board.content
  end

  def acknowledgements
    issue.acknowledgements.content
  end

  def submission_guidelines_page
    @submission_guidelines_page ||= PageDetail.new(PageQuery.submission_guidelines)
  end

  def old_cover_image
    helpers.image_tag issue.old_cover_image.url(:large)
  end


  def pdf_url
    if is_pdf?
      issue.pdf.url
    end
  end

  def essays
    EssayQuery.published_essays_for_issue(issue).collect { | e | EssayLink.new(e) }
  end

  def render_issue_header
    IssueHeader.render(issue, true)
  end
end
