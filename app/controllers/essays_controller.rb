class EssaysController < ApplicationController

  def index

  end


  def show
    @essay_detail = EssayDetail.build(self)
  end


  def transcript
    @essay_detail = EssayDetail.build(self)
  end

end
