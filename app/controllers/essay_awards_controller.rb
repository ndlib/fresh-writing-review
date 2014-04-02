class EssayAwardsController < ApplicationController

  def show
    @essay_award_detail = EssayAwardDetail.build(self)
    authorize_read_issue!(@essay_award_detail.issue)
  end

end
