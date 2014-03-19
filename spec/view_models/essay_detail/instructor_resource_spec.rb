require 'spec_helper'


describe EssayDetail::InstructorResources do


  let(:issue) { double(Issue, year: '2014', friendly_id: 'id') }
  let(:essay) { double(Essay, friendly_id: 'id', embed: "embed", issue: issue, instructor_resources: 'resource') }
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
