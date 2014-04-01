class MarkdownComponentFactory::IssueContent 
  include RailsHelpers
  include MarkdownComponentFactory

  attr_accessor :issue


  def initialize(params)
    @params = params
    @issue = ::Issue.friendly.exists?(self.determine_id) ? ::Issue.friendly.find(self.determine_id) : nil
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
