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
    @issue_detail = IssueDetail.build(self)
  end

  def editorial_board
    @issue_detail = IssueDetail.build(self)
  end

  def acknowledgements
    @issue_detail = IssueDetail.build(self)
  end

  def editorial_notes
    @issue_detail = IssueDetail.build(self)
  end
end
