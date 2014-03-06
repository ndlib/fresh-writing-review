require 'spec_helper'


describe EssayDetail do


  describe :build do

    it "builds from the url slug"

    it "takes into account which issue the essay is a part of "


  end

  let(:essay) { double(Essay, title: 'title', template: "text", body: "", alt_body: "", alt_title: "", author: "Bob Bobbers") }
  subject { described_class.new(essay)}

  describe :title do

    it "delegates this to essay" do
      expect(essay).to receive(:title)

      subject.title
    end
  end


  describe :author do

    it "creates a named anchor link and adds the by text" do
      expect(subject.author).to eq("By <a href=\"#author_biography\">Bob Bobbers</a>")
    end
  end

  describe :determine_template_class do

    it "determines the template is text_template when the essay template is text" do
      essay.stub(:template).and_return('text')

      expect(subject.send(:determine_template_class)).to eq(EssayTemplates::Text)
    end

    it "determines the template is media_template when the essay template is text" do
      essay.stub(:template).and_return('media')

      expect(subject.send(:determine_template_class)).to eq(EssayTemplates::Media)
    end

    it "raises an exception if the essay template is incorrect" do
      essay.stub(:template).and_return('not_a_template')

      expect {subject.send(:determine_template_class)}.to raise_error
    end
  end


  describe :render do

    it "passes the render off to the determinied template" do
      expect(subject.send(:display_template)).to receive(:render)

      subject.render
    end
  end

end
