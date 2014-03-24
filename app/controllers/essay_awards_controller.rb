class EssayAwardsController < ApplicationController

  def show
    @essay_award_detail = EssayAwardDetail.build(self)
  end

end
