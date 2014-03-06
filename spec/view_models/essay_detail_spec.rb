require 'spec_helper'


describe EssayDetail do


  describe :build do

    it "builds from the url slug"

    it "takes into account which issue the essay is a part of "


  end

  let(:essay) { double(Essay, title: 'title', template: "text", body: "", alt_body: "", alt_title: "") }

  describe :title do

    it "delegates this to essay" do
      expect(essay).to receive(:title)

      EssayDetail.new(essay).title
    end
  end


  describe :determine_template_class do

    it "determines the template is text_template when the essay template is text" do
      essay.stub(:template).and_return('text')

      expect(EssayDetail.new(essay).send(:determine_template_class)).to eq(EssayTemplates::Text)
    end

    it "determines the template is media_template when the essay template is text" do
      essay.stub(:template).and_return('media')

      expect(EssayDetail.new(essay).send(:determine_template_class)).to eq(EssayTemplates::Media)
    end

    it "raises an exception if the essay template is incorrect" do
      essay.stub(:template).and_return('not_a_template')

      expect { EssayDetail.new(essay).send(:determine_template_class)}.to raise_error
    end
  end


  describe :render do

    it "passes the render off to the determinied template" do
      ed = EssayDetail.new(essay)
      expect(ed.send(:display_template)).to receive(:render)

      ed.render
    end
  end

end
