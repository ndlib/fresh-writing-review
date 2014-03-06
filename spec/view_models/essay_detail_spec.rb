require 'spec_helper'


describe EssayDetail do


  describe :build do

    it "builds from the url slug"

    it "takes into account which issue the essay is a part of "


  end

  let(:essay) { double(Essay, title: 'title') }
  let(:text_essay) { double(Essay, title: 'title') }

  describe :title do

    it "delegates this to essay" do
      expect(essay).to receive(:title)

      EssayDetail.new(essay).title
    end
  end


  describe :display_template do

    it "determines the template is text_template when the essay template is text" do

    end

    it "determines the template is media_template when the essay template is text"
  end


  describe :render do

  end

end
