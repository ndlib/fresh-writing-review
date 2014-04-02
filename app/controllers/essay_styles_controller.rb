class EssayStylesController < ApplicationController
  def show
    @essay_style_detail = EssayStyleDetail.build(self)
    authorize_read_issue!(@essay_style_detail.issue)
  end
end
