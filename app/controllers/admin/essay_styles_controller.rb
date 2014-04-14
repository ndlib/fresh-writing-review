class Admin::EssayStylesController < AdminController

  def index
    @essay_styles = EssayStyleQuery.all
  end


  def edit
    @essay_style = EssayStyleQuery.find(params[:id])
  end


  def update
    @essay_style = EssayStyleQuery.find(params[:id])

    if @essay_style.update_attributes(params.require(:essay_style).permit(:title))
      flash[:success] = "Essay style \"#{@essay_style.title}\" updated"
      redirect_to admin_essay_styles_path()
    else
      render action: :edit
    end

  end


end
