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

  delegate :friendly_id, :title, :year, :essays, :is_pdf?, to: :issue

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

  def essay_styles
    EssayStyleQuery.all.collect {|essay_style| EssayStyleDetail.new(issue, essay_style)}
  end

  private
    def issue
      @issue
    end
end
