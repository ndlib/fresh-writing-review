class Admin::MarkdownController < AdminController

  layout 'admin'


  def edit
    @markdown_content = nil
    if MarkdownContent.exists?(params[:id])
      mcf = MarkdownComponentFactory.create(self)
      @markdown_content = MarkdownContent.find(params[:id])
      @markdown_content.component_parent = mcf.content_type
      @markdown_content.component_parent_id = mcf.component_parent
    else
      mcf = MarkdownComponentFactory.create(self)
      redirect_to request.url.gsub(/new/, mcf.markdown_id.to_s)
    end
    @markdown_content
  end


  def update
    @markdown_content = MarkdownContent.find(params[:id])

    if @markdown_content.update_attributes(markdown_content_params)
      flash[:success] = "Content saved"
      markdown_content = params[:markdown_content]
      parent_persist(markdown_content[:component_parent], markdown_content[:component_parent_id])
      redirect_to component_redirect_path(markdown_content[:component_parent], markdown_content[:component_parent_id])
    end
  end


  def add_image
    md = MarkdownContent.find(params[:id])
    i = md.images.create(:image => params[:file])
    render json: { success: true, image_path: i.image.url(:small) }
  end

  private

  def component_redirect_path(component_parent, component_parent_id)
    case component_parent
    when 'essay'
      essay = EssayQuery.find(component_parent_id)
      admin_issue_essay_path(:issue_id => essay.issue.id, :id => essay.id)
    when 'issue'
      issue = IssueQuery.find(component_parent_id)
      admin_issue_path(:id => issue.id)
    when 'award'
      award = AwardQuery.find(component_parent_id)
      admin_awards_path()
    when 'page'
      page = PageQuery.find(component_parent_id)
      admin_page_path(:id => component_parent_id)
    end
  end


  def parent_persist(component_parent, component_parent_id)
    case component_parent
    when 'essay'
      essay = EssayQuery.find(component_parent_id)
      essay.save!
    when 'issue'
      issue = IssueQuery.find(component_parent_id)
      issue.save!
    when 'award'
      award = AwardQuery.find(component_parent_id)
      award.save!
    when 'page'
      page = PageQuery.find(component_parent_id)
      page.save!
    end
  end


  def markdown_content_params
    params.require(:markdown_content).permit(:content)
  end

end
