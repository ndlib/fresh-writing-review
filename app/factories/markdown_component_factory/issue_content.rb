class MarkdownComponentFactory::IssueContent 
  include RailsHelpers
  include MarkdownComponentFactory

  attr_accessor :issue


  def initialize(params)
    @params = params
    @issue = ::Issue.find(self.determine_id)
  end


  def id
    @issue.id
  end


  def essays
    @issue.essays
  end


  def determine_id
    if @params[:controller] == 'admin/issues'
      @params[:id]
    else
      @params[:issue_id]
    end
  end

end
