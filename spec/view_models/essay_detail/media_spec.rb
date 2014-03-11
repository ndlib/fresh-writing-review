require 'spec_helper'


describe EssayDetail::Media do
  let(:essay) { double(Essay, title: 'title', body: 'body', alt_title: 'alt_title', embed: "embed") }
  subject { described_class.new(essay)}

  describe :render do

    it "renders the correct tempalte and variables" do
      expect(subject).to receive(:render_to_string).with('/essays/media_template', { object: subject })
      subject.render
    end

  end

  describe :body do

    it "gets the body from the essay " do
      expect(essay).to receive(:body)
      subject.body
    end

    it "converts markdown to html" do
      expect(MarkDownConverter).to receive(:call).with('body')
      subject.body
    end
  end


  describe :alt_title do
    it "gets the alt_title from the essay " do
      expect(essay).to receive(:alt_title)
      subject.alt_title
    end
  end


  describe :embed do
    it "gets the embed from the essay" do
      expect(essay).to receive(:embed)
      subject.embed
    end

    it "returns the raw html" do
      expect(subject.send(:helpers)).to receive(:raw)
      subject.embed
    end
  end


  describe :transcript_link do

    it "shows the transcript link if it should show_transcripts" do
      subject.stub(:show_transcript?).and_return(true)
      expect(subject.transcript_link).to eq("<a href=\"#\">Transcript</a>")
    end

    it "does not show the transcript link if it should not show transcripts" do
      subject.stub(:show_transcript?).and_return(false)
      expect(subject.transcript_link).to eq(nil)
    end
  end


  describe :show_transcript? do

    it "returns true if the alt body is present" do
      essay.stub(:alt_body).and_return("alt body!!")
      expect(subject.send(:show_transcript?)).to be_true
    end

    it "returns false if the alt_body is nil" do
      essay.stub(:alt_body).and_return(nil)
      expect(subject.send(:show_transcript?)).to be_false
    end

    it "returns false if the alt_body is empty" do
      essay.stub(:alt_body).and_return("")
      expect(subject.send(:show_transcript?)).to be_false
    end

  end

end
