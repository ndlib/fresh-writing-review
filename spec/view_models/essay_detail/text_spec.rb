require 'spec_helper'


describe EssayDetail::Text do
  let(:essay) { double(Essay, title: 'title', body: 'body', alt_title: 'alt_title', alt_body: 'alt_body') }
  subject { described_class.new(essay)}

  describe :render do

    it "renders the correct tempalte and variables" do
      expect(subject).to receive(:render_to_string).with('/essays/text_template', { object: subject })
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

  describe :alt_body do

    it "gets the alt_body from the essay " do
      expect(essay).to receive(:alt_body)
      subject.alt_body
    end


    it "converts markdown to html" do
      expect(MarkDownConverter).to receive(:call).with('alt_body')
      subject.alt_body
    end

  end

  describe :alt_title do
    it "gets the alt_title from the essay " do
      expect(essay).to receive(:alt_title)
      subject.alt_title
    end
  end


  describe :alternate_body do

    it "yields the content if the alternate_body should be shown" do
      subject.stub(:show_alt_body?).and_return(true)
      expect(subject.alternate_body { "hi" }).to eq("hi")
    end

    it "does not yield the content if the alternate_body should not be shown" do
      subject.stub(:show_alt_body?).and_return(false)
      expect(subject.alternate_body { "hi" }).to eq(nil)
    end
  end


  describe :show_alt_body? do

    it "returns true if the alt_body is present" do
      essay.stub(:alt_body).and_return("alt body!!")
      expect(subject.send(:show_alt_body?)).to be_true
    end

    it "returns false if the alt_body is nil" do
      essay.stub(:alt_body).and_return(nil)
      expect(subject.send(:show_alt_body?)).to be_false
    end

    it "returns false if the alt_body is empty" do
      essay.stub(:alt_body).and_return("")
      expect(subject.send(:show_alt_body?)).to be_false
    end

  end
end
