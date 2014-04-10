class Admin::AwardsController < AdminController

  def index
    @awards = AwardQuery.all
  end


  def edit
    @award = AwardQuery.find(params[:id])
  end


  def update
    @award = AwardQuery.find(params[:id])

    if @award.update_attributes(params.require(:award).permit(:title))
      flash[:success] = "Award \"#{@award.title}\" updated"
      redirect_to admin_awards_path()
    else
      render action: :edit
    end

  end


end
