class IssueNav
  include RailsHelpers

  delegate :friendly_id, :year, to: :issue

  def initialize(issue)
    @issue = issue
  end

  def render
    render_to_string 'issues/nav', issue_nav: self
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

  def link_to_acknowledgements
    helpers.link_to("Acknowledgements", routes.acknowledgements_issue_path(friendly_id))
  end

  def essay_styles
    EssayStyleQuery.all.collect {|essay_style| EssayStyleDetail.new(issue, essay_style)}
  end


  def awards
    AwardQuery.all.collect { |award| AwardDetail.new(issue, award) }
  end


  private
    def issue
      @issue
    end
end
