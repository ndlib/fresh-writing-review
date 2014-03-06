class EssayStyleDetail
  include RailsHelpers

  def self.build(controller)
    issue = IssueQuery.year(controller.params.require(:issue_id))
    essay_style = EssayStyleQuery.slug(controller.params.require(:id))

    self.new(issue, essay_style)
  end

  delegate :slug, :title, to: :essay_style

  def initialize(issue, essay_style)
    @essay_style = essay_style
    @issue = issue
  end

  private
    def essay_style
      @essay_style
    end

    def issue
      @issue
    end
end
