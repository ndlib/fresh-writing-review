class AwardsController < ApplicationController

  def show
    @award_detail = AwardDetail.build(self)
    authorize_read_issue!(@award_detail.issue)
  end

end
