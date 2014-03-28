class MarkdownComponentFactory::IssueContent 
  include RailsHelpers
  include MarkdownComponentFactory


  def initialize(params)
    @params = params
    @issue = ::Issue.find(params[:issue_id])
  end


  def id
    @issue.id
  end


  def essays
    @issue.essays
  end

end
