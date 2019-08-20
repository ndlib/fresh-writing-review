require 'spec_helper'


describe EssayDetail::WorksCited do

  let(:essay) { double(Essay, works_cited: double(MarkdownContent, content: "works_cited")) }
  subject { described_class.new(essay) }

  describe 'self_render' do

    it "instanciates itself and renders" do
      described_class.any_instance.should_receive(:render)

      described_class.render(essay)
    end

  end


  it "has an essay " do
    expect(subject.essay).to eq(essay)
  end


  it "returns the markdown" do
    expect(subject.markdown).to match "<p>works_cited</p>"
  end


  describe 'render' do
    context 'has_works_cited' do

      it "renders the template " do
        expect(subject).to receive(:render_to_string).with('/essays/works_cited', { object: subject })

        subject.render
      end


      it "renders with out error " do
        expect { subject.render }.to_not raise_error
      end
    end

    context 'no_work_cited' do
      let(:essay) { double(Essay, works_cited: double(MarkdownContent, content: nil)) }

      it "does not render the template" do
        expect(subject).to_not receive(:render_to_string)
        subject.render
      end
    end
  end
end

