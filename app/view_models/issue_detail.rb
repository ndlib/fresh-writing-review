class IssueDetail
  include RailsHelpers

  def self.build(controller)
    issue = IssueQuery.year(controller.params.require(:id))

    self.new(issue)
  end

  delegate :year, :editorial_notes, :editorial_board, :acknowledgments, to: :issue

  def initialize(issue)
    @issue = issue
  end

  private
    def issue
      @issue
    end
end
