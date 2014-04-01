class Admin::IssueList


  def self.build(controller)
    self.new
  end


  def issues
    @issues ||= IssueQuery.all.collect { | i | Admin::IssueDetail.new(i) }
  end


end
