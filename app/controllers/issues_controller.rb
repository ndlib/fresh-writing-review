class IssuesController < ApplicationController
  def index
    @issue_list = IssueList.build(self)
  end
end
