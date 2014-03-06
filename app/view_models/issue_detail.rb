class IssueDetail
  include RailsHelpers

  def self.build(controller)
    issue = IssueQuery.find(controller.params.require(:id))

    self.new(issue)
  end

  delegate :friendly_id, :year, :essays, :editorial_notes, :editorial_board, :acknowledgments, to: :issue

  def initialize(issue)
    @issue = issue
  end

  def link_to_show
    helpers.link_to(year, routes.issue_path(friendly_id))
  end

  def link_to_editorial_board
    helpers.link_to("Editorial Board", routes.editorial_board_issue_path(friendly_id))
  end

  def link_to_editorial_notes
    helpers.link_to("Note from the Editors", routes.editorial_notes_issue_path(friendly_id))
  end

  def link_to_acknowledgments
    helpers.link_to("Acknowledgments", routes.acknowledgments_issue_path(friendly_id))
  end

  def essay_styles
    EssayStyleQuery.all.collect {|essay_style| EssayStyleDetail.new(issue, essay_style)}
  end

  private
    def issue
      @issue
    end
end
