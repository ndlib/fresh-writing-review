class MarkdownComponentFactory::IssueContent 
  include RailsHelpers
  include MarkdownComponentFactory

  attr_accessor :issue


  def initialize(params)
    @params = params
    @issue =  IssueQuery.find(self.determine_id)
  end


  def id
    @issue.id
  end


  def component_name
    case @params[:id].to_i
    when @issue.editorial_notes ? @issue.editorial_notes.id : nil
      'Editorial Notes'
    when @issue.editorial_board ? @issue.editorial_board.id : nil
      'Editorial Board'
    when @issue.acknowledgements ? @issue.acknowledgements.id : nil
      'Acknowledgements'
    else
      'Unidentified Markdown'
    end
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
