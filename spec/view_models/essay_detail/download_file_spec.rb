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
      essay.stub(:essay_files).and_return([ double(EssayStyle, id: 1) ])
      expect(subject.has_files?).to be_true
    end


    it "returns true if the essay_files has any files" do
      essay.stub(:essay_files).and_return([ ])
      expect(subject.has_files?).to be_false
    end

  end


  describe :title do

  end
end
