class EssayStyleDetail
  include RailsHelpers

  def self.build(controller)
    issue = IssueQuery.find(controller.params.require(:issue_id))
    essay_style = EssayStyleQuery.find(controller.params.require(:id))

    self.new(issue, essay_style)
  end

  delegate :friendly_id, :title, to: :essay_style
  delegate :year, to: :issue_detail

  def initialize(issue, essay_style)
    @essay_style = essay_style
    @issue_detail = IssueDetail.new(issue)
  end

  def link_to_show
    helpers.link_to(title, routes.issue_essay_style_path(issue_detail.friendly_id, friendly_id))
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
