require 'spec_helper'


describe EssayDetail::Embed do

  let(:issue) { double(Issue, year: '2014', friendly_id: 'id') }
  let(:essay) { double(Essay, friendly_id: 'id', alt_body: double(MarkdownContent, content: "alt"), embed: double(MarkdownContent, content: "embed"), issue: issue, published_medium: 'video') }
  let(:no_embed_essay) { double(Essay, friendly_id: 'id', embed: nil, issue: issue, published_medium: 'text') }
  subject { described_class.new(essay) }

  describe :self_render do

    it "instanciates itself and renders" do
      described_class.any_instance.should_receive(:render)

      described_class.render(essay)
    end

  end


  it "has an essay " do
    expect(subject.essay).to eq(essay)
  end


  it "returns the embed" do
    expect(subject.markdown).to match "<p>embed</p>"
  end


  describe :transcript_link do
    it "returns the link" do
      expect(subject.transcript_link).to eq("<a href=\"/volumes/id/essays/id/transcript\">Transcript</a>")
    end
  end



  describe :render do
    it "renders the template " do
      expect(subject).to receive(:render_to_string).with('/essays/embed', { object: subject })
      subject.render
    end


    it "renders with out error " do
      expect { subject.render }.to_not raise_error
    end


    context :no_embed_essay do
      subject { described_class.new(no_embed_essay) }

      it "renders the feature image" do
        expect(subject).to receive(:render_to_string).with('/essays/coverimage', { object: subject })
        subject.render
      end
    end

  end
end

