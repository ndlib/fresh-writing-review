class IssuesController < ApplicationController
  def index
    @issue_list = IssueList.build(self)
  end

  def current
    if IssueQuery.current?
      @issue_detail = IssueDetail.current
      render action: :show
    else
      redirect_to(issues_path)
    end
  end

  def show
    @issue_detail = build_issue_detail
  end

  def editorial_board
    @issue_detail = build_issue_detail
  end

  def acknowledgements
    @issue_detail = build_issue_detail
  end

  def editorial_notes
    @issue_detail = build_issue_detail
  end

  private
    def build_issue_detail
      issue_detail = IssueDetail.build(self)
      authorize_read_issue!(issue_detail.issue)
      issue_detail
    end
end
