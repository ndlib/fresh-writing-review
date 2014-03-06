class IssueList
  include RailsHelpers

  def self.build(controller)
    issues = IssueQuery.all

    self.new(issues)
  end

  delegate :each, to: :issues

  def initialize(issues)
    @issues = issues
  end

  def link_to_issue(issue)
    helpers.link_to(issue.year, routes.issue_path(issue.year))
  end

  private
    def issues
      @issues
    end
end