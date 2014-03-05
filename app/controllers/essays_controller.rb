class EssaysController < ApplicationController


  def show
    @essay_detail = EssayDetail.build(self)
  end


end
