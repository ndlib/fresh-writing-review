class IssueList
  include RailsHelpers

  def self.build(controller)
    issues = IssueQuery.published

    self.new(issues)
  end

  delegate :each, to: :issues

  def initialize(issues)
    @issues = issues
  end

  def link_to_issue(issue)
    helpers.link_to(issue.title, routes.issue_path(issue.friendly_id))
  end

  private
    def issues
      @issues
    end
end
