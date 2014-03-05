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

  private
    def issues
      @issues
    end
end
