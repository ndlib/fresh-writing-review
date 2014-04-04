require 'spec_helper'

describe LinkToRouteWithImage do


  it "creates the correct html " do
    expect(LinkToRouteWithImage.call('route', 'title', 'img')).to eq("<a href=\"route\"><img alt=\"Img\" src=\"/images/img\" /></a> <a class=\"title\" href=\"route\">title</a>")
  end

end
