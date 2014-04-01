require 'spec_helper'


describe EssayDetail::DownloadFile do

  let(:essay) { double(Essay, id: 1, essay_files: [] ) }
  subject { described_class.new(essay) }

  describe :self_render do

    it "instanciates itself and renders" do
      described_class.any_instance.should_receive(:render)

      described_class.render(essay)
    end
  end


  describe :has_files? do

    it "returns true if the essay_files has any files" do
      essay.stub(:attached_file).and_return(double(AttachedFile, id: 1) )
      expect(subject.has_files?).to be_true
    end


    it "returns true if the essay_files has any files" do
      essay.stub(:attached_file).and_return(nil)
      expect(subject.has_files?).to be_false
    end

  end


  describe :title do

    it "returns the title from the file" do
      essay.stub(:attached_file).and_return(double(AttachedFile, id: 1, title: "title"))
      expect(subject.title).to eq("title")
    end

  end


  describe :body do

    it "returns the body if there is a body" do
      essay.stub(:attached_file).and_return(double(AttachedFile, id: 1, body: "body"))
      expect(subject.body).to eq("body")
    end

  end
end
