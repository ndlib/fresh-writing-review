require 'spec_helper'


describe EssayDetail do


  describe :build do

    it "builds from the url slug"

    it "takes into account which issue the essay is a part of "


  end

  let(:issue) { double(Issue, year: '2014', friendly_id: 'id') }
  let(:essay_style) { double(EssayStyle, title: 'narrative', friendly_id: 'id')}
  let(:essay) { double(Essay, title: 'title', template: "text", friendly_id: 'id', body: "", alt_body: "", alt_title: "", author: "Bob Bobbers", issue: issue, essay_style: essay_style) }
  subject { described_class.new(essay)}



  describe :render_header do
    it "calls the sub view model" do
      expect(EssayDetail::Header).to receive(:render).with(essay)
      subject.render_header
    end
  end

  describe :render_embed do
    it "calls the sub view model" do
      expect(EssayDetail::Embed).to receive(:render).with(essay)
      subject.render_embed
    end
  end


  describe :render_body do
    it "calls the sub view model" do
      expect(EssayDetail::Body).to receive(:render).with(essay)
      subject.render_body
    end
  end


  describe :render_transcript do
    it "calls the sub view model" do
      expect(EssayDetail::Transcript).to receive(:render).with(essay)
      subject.render_transcript
    end
  end


  describe :render_alternate_body do
    it "calls the sub view model" do
      expect(EssayDetail::AlternateBody).to receive(:render).with(essay)
      subject.render_alternate_body
    end
  end


  describe :render_works_cited do
    it "calls the sub view model" do
      expect(EssayDetail::WorksCited).to receive(:render).with(essay)
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
      expect(EssayDetail::AuthorBiography).to receive(:render).with(essay)
      subject.render_author_biography
    end
  end



end
