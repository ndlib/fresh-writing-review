require 'spec_helper'


describe EssayDetail::Embed do

  let(:essay) { double(Essay, embed: "embed") }
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


  describe :render do
    it "renders the template " do
      expect(subject).to receive(:render_to_string).with('/essays/embed', { object: subject })
      subject.render
    end

    it "renders with out error " do
      expect { subject.render }.to_not raise_error
    end
  end
end

