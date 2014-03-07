class IssueNav
  include RailsHelpers

  delegate :friendly_id, :year, to: :issue

  def initialize(issue)
    @issue = issue
  end

  def render
    helpers.render partial: 'issues/nav', locals: { issue_nav: self }
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

  private
    def issue
      @issue
    end
end
