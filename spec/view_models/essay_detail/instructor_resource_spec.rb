require 'spec_helper'


describe EssayDetail::InstructorResources do


  let(:issue) { double(Issue, year: '2014', friendly_id: 'id') }
  let(:essay) { double(Essay, friendly_id: 'id', embed: "embed", issue: issue, instructor_resources: double(MarkdownContent, content: 'resource')) }
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


  it "returns the markdown" do
    expect(subject.markdown).to eq("<p>resource</p>\n")
  end


  describe "#has_content" do

    it "returns true if the markdown_content object says it has content" do
      subject.send(:markdown_object).stub(:present?).and_return(true)
      expect(subject.has_content?).to be_true
    end

    it "returns false if the markdown_content object says it does not have content" do
      subject.send(:markdown_object).stub(:present?).and_return(false)
      expect(subject.has_content?).to be_false
    end
  end

  describe :render do

    it "renders the template " do
      expect(subject).to receive(:render_to_string).with('/essays/instructor_resources', { object: subject })
      subject.render
    end


    it "renders with out error " do
      expect { subject.render }.to_not raise_error
    end

  end
end
