class EssayStylesController < ApplicationController
  def show
    @essay_style_detail = EssayStyleDetail.build(self)
  end
end
