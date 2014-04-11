class Admin::MarkdownEditorFunctions
  include RailsHelpers

  attr_accessor :mc

  def self.build(application)
    mc = MarkdownComponentFactory.create(application)
    self.new(mc)
  end


  def initialize(mc)
    @mc = mc
  end


  def essay_content_link(component_name)
    if new_content?(component_name)
      routes.edit_admin_issue_essay_markdown_content_path(issue_id: @mc.essay.issue.id, essay_id: @mc.essay.id, id: 'new') + "?component_type=#{component_name}"
    else
      routes.edit_admin_issue_essay_markdown_content_path(issue_id: @mc.essay.issue.id, essay_id: @mc.essay.id, id: @mc.essay.send(component_name).id)
    end
  end


  def essay_content_status(component_name)
    if new_content?(component_name)
      'Not Visited'
    else
      'Done'
    end
  end


  def issue_content_link(component_name)
    if new_content?(component_name)
      routes.edit_admin_issue_markdown_content_path(issue_id: @mc.issue.id, id: 'new') + "?component_type=#{component_name}"
    else
      routes.edit_admin_issue_markdown_content_path(issue_id: @mc.issue.id, id: @mc.issue.send(component_name).id) + "?component_type=#{component_name}"
    end
  end


  def issue_content_status(component_name)
    if new_content?(component_name)
      'Not Visited'
    else
      'Done'
    end
  end


  def award_content_link
  end

  def content_blank?(component_name)
    content = content_object(component_name)
    if content.nil?
      true
    else
      content.content_blank?
    end
  end

  private

  def content_object(component_name)
    case @mc.content_type
    when 'essay'
      @mc.essay.send(component_name)
    when 'issue'
      @mc.issue.send(component_name)
    when 'award'
      @mc.award.send(component_name)
    when 'page'
      @mc.page.send(component_name)
    end
  end

  def new_content?(component_name)
    content = content_object(component_name)
    content.blank?
  end

end
