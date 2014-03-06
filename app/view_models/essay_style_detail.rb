class EssayStyleDetail
  include RailsHelpers

  def self.build(controller)
    issue = IssueQuery.year(controller.params.require(:issue_id))
    essay_style = EssayStyleQuery.slug(controller.params.require(:id))

    self.new(issue, essay_style)
  end

  delegate :slug, :title, to: :essay_style
  delegate :year, to: :issue_detail

  def initialize(issue, essay_style)
    @essay_style = essay_style
    @issue_detail = IssueDetail.new(issue)
  end

  def link_to_show
    helpers.link_to(title, routes.issue_essay_style_path(issue_detail.year, slug))
  end

  def link_to_issue
    issue_detail.link_to_show
  end

  private
    def essay_style
      @essay_style
    end

    def issue_detail
      @issue_detail
    end
end
