class EssayStyleDetail
  include RailsHelpers

  def self.build(controller)
    issue = IssueQuery.find(controller.params.require(:issue_id))
    essay_style = EssayStyleQuery.find(controller.params.require(:id))

    self.new(issue, essay_style)
  end

  delegate :friendly_id, :title, to: :essay_style
  delegate :year, to: :issue_detail

  attr_accessor :issue, :essay_style

  def initialize(issue, essay_style)
    @essay_style = essay_style
    @issue = issue
    @issue_detail = IssueDetail.new(issue)
  end

  def style_id
    essay_style.id
  end

  def link_to_show
    helpers.link_to(title, routes.issue_essay_style_path(issue_detail.friendly_id, friendly_id), class: "title")
  end

  def link_to_show_with_image
    helpers.link_to(PlaceholderImage.call(211, 135, style_id), routes.issue_essay_style_path(issue_detail.friendly_id, friendly_id))
  end

  def link_to_issue
    issue_detail.link_to_show
  end

  def link_to_essay(essay)
    helpers.link_to(essay.title, routes.issue_essay_path(issue_detail.friendly_id, essay.friendly_id))
  end

  def essays
    EssayQuery.essays_for_issue_and_essay_style(issue, essay_style)
  end

  def render_highlighted_essay
    if highlighted_essay.present?
      render_to_string "essay_styles/highlighted_essay", highlighted_essay_detail: highlighted_essay
    else
      nil
    end
  end

  def highlighted_essay
    @highlighted_essay ||= HighlightedEssayDetail.new(issue, essay_style)
  end

  private
    def issue_detail
      @issue_detail
    end

end
