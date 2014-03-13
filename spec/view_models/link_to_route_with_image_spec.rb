require 'spec_helper'

describe LinkToRouteWithImage do


  it "creates the correct html " do
    expect(LinkToRouteWithImage.call('route', 'title', 1)).to eq("<a href=\"route\"><img alt=\"Fff\" src=\"http://placehold.it/211x135/A4A774/fff\" /></a> <a class=\"title\" href=\"route\">title</a>")
  end

end
