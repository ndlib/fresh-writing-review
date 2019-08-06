require 'spec_helper'


describe EssayDetail::InstructorResources do

  def attached_file(params = {})
    double(AttachedFile, params)
  end
  let(:issue) { double(Issue, year: '2014', friendly_id: 'id') }
  let(:essay) { double(Essay, friendly_id: 'id', embed: "embed", issue: issue, instructor_resources: double(MarkdownContent, content: 'resource')) }
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
    expect(subject.markdown).to match "<p>resource</p>"
  end


  describe '#link_to_detail' do
    it "returns the link if there is instructor content" do
      subject.stub(:has_content?).and_return(true)
      expect(subject.link_to_detail).to eq("<a class=\"\" href=\"/volumes/id/essays/id/instructor_resources\">Instructor Resources</a>")
    end


    it "allows you set the css class for the link" do
      subject.stub(:has_content?).and_return(true)
      expect(subject.link_to_detail('css')).to eq("<a class=\"css\" href=\"/volumes/id/essays/id/instructor_resources\">Instructor Resources</a>")
    end


    it "returns nil if there is not instructor content" do
      subject.stub(:has_content?).and_return(false)
      expect(subject.link_to_detail).to eq(nil)
    end
  end

  describe '#has_content?' do
    it "returns true if #has_markdown_content? is true" do
      subject.stub(:has_markdown_content?).and_return(true)
      subject.stub(:has_files?).and_return(false)
    end

    it "returns true if #has_files? is true" do
      subject.stub(:has_markdown_content?).and_return(false)
      subject.stub(:has_files?).and_return(true)
    end

    it "returns false if neither is true" do
      subject.stub(:has_markdown_content?).and_return(false)
      subject.stub(:has_files?).and_return(false)
    end
  end


  describe "#has_markdown_content?" do

    it "returns true if the markdown_content object says it has content" do
      subject.send(:markdown_object).stub(:present?).and_return(true)
      expect(subject.has_markdown_content?).to be_truthy
    end

    it "returns false if the markdown_content object says it does not have content" do
      subject.send(:markdown_object).stub(:present?).and_return(false)
      expect(subject.has_markdown_content?).to be_falsey
    end

  end

  describe '#has_files?' do

    it "returns true if there are any files" do
      subject.stub(:files).and_return([attached_file()])
      expect(subject.has_files?).to be_truthy
    end


    it "returns false if there are no files" do
      subject.stub(:files).and_return([])
      expect(subject.has_files?).to be_falsey
    end

  end

  describe '#files' do
    it "returns an array of files" do
      file = attached_file()
      expect(essay).to receive(:instructor_resources_files).and_return([file])
      expect(subject.files).to eq([file])
    end

    it "returns an empty array if the essay has no files" do
      expect(essay).to receive(:instructor_resources_files).and_return([])
      expect(subject.files).to eq([])
    end
  end

  describe 'render' do

    it "renders the template " do
      expect(subject).to receive(:render_to_string).with('/essays/instructor_resources', { object: subject })
      subject.render
    end

    it "renders with out error " do
      file = attached_file(title: "test", file: double(EssayDetail::DownloadFile, url: "test"), body: "test")
      expect(essay).to receive(:instructor_resources_files).and_return([file])
      expect { subject.render }.to_not raise_error
    end
  end
end
