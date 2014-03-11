require 'spec_helper'


describe EssayDetail do


  describe :build do

    it "builds from the url slug"

    it "takes into account which issue the essay is a part of "


  end

  let(:issue) { double(Issue, year: '2014', friendly_id: 'id') }
  let(:essay_style) { double(EssayStyle, title: 'narrative', friendly_id: 'id')}
  let(:essay) { double(Essay, title: 'title', template: "text", body: "", alt_body: "", alt_title: "", author: "Bob Bobbers", issue: issue, essay_style: essay_style) }
  subject { described_class.new(essay)}


  describe :render_header do
    it "calls the sub view model" do
      expect(EssayHeader).to receive(:render).with(essay)
      subject.render_header
    end
  end


  describe :render_works_cited do
    it "calls the sub view model" do
      expect(EssayWorksCited).to receive(:render).with(essay)
      subject.render_works_cited
    end
  end


  describe :render_discussion_questions do
    it "calls the sub view model" do
      expect(EssayDetail::DiscussionQuestions).to receive(:render).with(essay)
      subject.render_discussion_questions
    end
  end


  describe :render_author_biography do
    it "calls the sub view model" do
      expect(AuthorBiographyDetail).to receive(:render).with(essay)
      subject.render_author_biography
    end
  end


  describe :determine_template_class do

    it "determines the template is text_template when the essay template is text" do
      essay.stub(:template).and_return('text')

      expect(subject.send(:determine_template_class)).to eq(EssayDetail::Text)
    end

    it "determines the template is media_template when the essay template is text" do
      essay.stub(:template).and_return('media')

      expect(subject.send(:determine_template_class)).to eq(EssayDetail::Media)
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
