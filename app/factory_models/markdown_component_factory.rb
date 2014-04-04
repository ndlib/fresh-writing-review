module MarkdownComponentFactory
  include RailsHelpers

  def self.create(application)
    @params = application.request.path_parameters
    if @params[:page_id] || @params[:conroller] == 'admin/pages'
      @@content_type = 'page'
      MarkdownComponentFactory::PageContent.new(@params)
    elsif @params[:essay_award_id] || @params[:controller] == 'admin/essay_awards'
      @@content_type = 'essay_award'
      MarkdownComponentFactory::EssayAwardContent.new(@params)
    elsif @params[:issue_id] && @params[:essay_id] || @params[:controller] == 'admin/essays'
      @@content_type = 'essay'
      MarkdownComponentFactory::EssayContent.new(@params)
    else
      @@content_type = 'issue'
      MarkdownComponentFactory::IssueContent.new(@params)
    end
  end
  
  
  def content_type
    @@content_type
  end

  def markdown_id
    if self.content_type == 'essay'
      self.essay.add_new_component(params[:component_type], "Please Edit")
    elsif self.content_type = 'issue'
      self.issue.add_new_component(params[:component_type], "Please Edit")
    elsif self.content_type = 'essay_award'
      self.essay_award.add_new_component(params[:component_type], "Please Edit")
    end
  end


  def component_parent
    case self.content_type
    when 'essay'
      self.essay.id
    when 'issue'
      self.issue.id
    when 'essay_award'
      self.essay_award.id
    end
  end

end
