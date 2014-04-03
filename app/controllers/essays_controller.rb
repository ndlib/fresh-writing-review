class EssaysController < ApplicationController

  def show
    @essay_detail = build_essay
  end


  def transcript
    @essay_detail = build_essay
  end


  def instructor_resources
    @essay_detail = build_essay
  end

  private

    def build_essay
      essay_detail = EssayDetail.build(self)
      authorize_read_issue!(essay_detail.issue)
      essay_detail
    end

end
