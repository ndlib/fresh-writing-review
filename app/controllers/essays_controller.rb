class EssaysController < ApplicationController

  def show
    @essay_detail = EssayDetail.build(self)
  end


  def transcript
    @essay_detail = EssayDetail.build(self)
  end


  def instructor_resources
    @essay_detail = EssayDetail.build(self)
  end

end
