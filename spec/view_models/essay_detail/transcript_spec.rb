require 'spec_helper'


describe EssayDetail::Transcript do

  let(:issue) { double(Issue, id: 1, friendly_id: 'fid')}
  let(:essay) { double(Essay, embed: "embed", alt_body: double(MarkdownContent, content: "alt_body"), issue: issue) }
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
    expect(subject.markdown).to match "<p>alt_body</p>"
  end


  describe 'display_body?' do
    context 'has_a_body' do
      it "returns true if the markdown_detail says it is there and the format is text " do
        subject.stub(:essay_format).and_return(double(EssayFormat, media?: true))
        subject.stub(:markdown_object).and_return(double(MarkdownDetail, present?: true))

        expect(subject.send(:display_body?)).to be_truthy
      end


      it "returns false if there is a body and the format is not text" do
        subject.stub(:essay_format).and_return(double(EssayFormat, media?: true))
        subject.stub(:markdown_object).and_return(double(MarkdownDetail, present?: false))

        expect(subject.send(:display_body?)).to be_falsey
      end
    end

    context 'no_body' do
      it "returns false if there is no body and the format is text" do
        subject.stub(:essay_format).and_return(double(EssayFormat, media?: false))
        subject.stub(:markdown_object).and_return(double(MarkdownDetail, present?: true))

        expect(subject.send(:display_body?)).to be_falsey
      end


      it "retruns false if there is no body and the format is not text" do
        subject.stub(:essay_format).and_return(double(EssayFormat, media?: false))
        subject.stub(:markdown_object).and_return(double(MarkdownDetail, present?: false))

        expect(subject.send(:display_body?)).to be_falsey
      end

    end
  end


  describe 'render' do
    context 'display_body?' do
      before(:each) do
        subject.stub(:display_body?).and_return(true)
      end

      it "renders the template " do
        expect(subject).to receive(:render_to_string).with('/essays/transcript', { object: subject })
        subject.render
      end


      it "renders with out error " do
        expect { subject.render }.to_not raise_error
      end

    end

    context 'no_embed' do
      before(:each) do
        subject.stub(:display_body?).and_return(false)
      end
      it "does not render the template" do
        expect(subject).to_not receive(:render_to_string)
        subject.render
      end
    end
  end

end

