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
    helpers.link_to(helpers.image_tag(issue.small_cover_image.url(:large)), routes.issue_path(issue.friendly_id), class: "cover-image") +
    helpers.link_to(issue.title, routes.issue_path(issue.friendly_id), class: "title")
  end


  def small_cover_image_url(issue)
    issue.small_cover_image.url(:large)
  end


  private
    def issues
      @issues
    end
end
