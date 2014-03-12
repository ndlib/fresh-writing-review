class SearchController < ApplicationController


  def index
    @essay_search = EssaySearch.build(self)
  end

end
