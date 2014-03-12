require 'spec_helper'


describe EssayDetail::Embed do

  let(:issue) { double(Issue, year: '2014', friendly_id: 'id') }
  let(:essay) { double(Essay, friendly_id: 'id', embed: "embed", issue: issue) }
  let(:no_embed_essay) { double(Essay, friendly_id: 'id', embed: "", issue: issue) }
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
    expect(subject.embed).to eq("embed")
  end


  describe :transcript_link do
    it "returns the link" do
      expect(subject.transcript_link).to eq("<a href=\"/issues/id/essays/id/transcript\">Transcript</a>")
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

      it "does not render the template when there is no embed code" do

        expect(subject.render).to eq("")
      end
    end

  end
end

