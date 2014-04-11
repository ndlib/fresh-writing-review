module MarkdownComponentFactory
  include RailsHelpers

  def self.create(application)
    @params = application.request.parameters
    if @params[:page_id] || @params[:conroller] == 'admin/pages'
      @@content_type = 'page'
      MarkdownComponentFactory::PageContent.new(@params)
    elsif @params[:award_id] || @params[:controller] == 'admin/awards'
      @@content_type = 'award'
      MarkdownComponentFactory::AwardContent.new(@params)
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


  def params
    @params
  end


  def markdown_id
    if self.content_type == 'essay'
      self.essay.add_new_component(@params[:component_type], "")
    elsif self.content_type = 'issue'
      self.issue.add_new_component(@params[:component_type], "")
    elsif self.content_type = 'award'
      self.award.add_new_component(@params[:component_type], "")
    end
  end


  def component_parent
    case self.content_type
    when 'essay'
      self.essay.id
    when 'issue'
      self.issue.id
    when 'page'
      self.page.id
    when 'award'
      self.award.id
    end
  end




end
