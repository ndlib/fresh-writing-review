class IssuesController < ApplicationController
  def index
    @issue_list = IssueList.build(self)
  end

  def show
    @issue_detail = IssueDetail.build(self)
  end

  def editorial_board
    @issue_detail = IssueDetail.build(self)
  end

  def acknowledgments
    @issue_detail = IssueDetail.build(self)
  end

  def editorial_notes
    @issue_detail = IssueDetail.build(self)
  end
end
