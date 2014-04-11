class Admin::EssayAwardsController < AdminController

  def new
    @essay_award = EssayAward.new(essay: essay)
  end

  def create
    @essay_award = EssayAward.new(params.require(:essay_award).permit(:award_id, :placement))
    @essay_award.essay = essay
    if @essay_award.save
      flash[:success] = "Award \"#{@essay_award.title}\" added"
      redirect_to admin_issue_essay_path(params[:issue_id], params[:essay_id])
    else
      render action: :new
    end
  end

  def edit
    @essay_award = EssayAward.find(params[:id])
  end

  def update
    @essay_award = EssayAward.find(params[:id])

    if @essay_award.update_attributes(params.require(:essay_award).permit(:award_id, :placement))
      flash[:success] = "Award \"#{@essay_award.title}\" updated"
      redirect_to admin_issue_essay_path(params[:issue_id], params[:essay_id])
    else
      render action: :edit
    end
  end

  def destroy
    @essay_award = EssayAward.find(params[:id])
    @essay_award.destroy
    flash[:success] = "Award \"#{@essay_award.title}\" removed"
    redirect_to admin_issue_essay_path(params[:issue_id], params[:essay_id])
  end

  private
    def essay
      @essay ||= EssayQuery.find(params[:essay_id])
    end


end
