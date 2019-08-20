require 'spec_helper'


describe EssayDetail::DownloadFile do

  let(:attached_file) { double(AttachedFile, id: 1) }
  subject { described_class.new(attached_file) }

  describe 'self_render' do

    it "instanciates itself and renders" do
      described_class.any_instance.should_receive(:render)

      described_class.render(attached_file)
    end
  end


  describe 'title' do

    it "returns the title from the file" do
      expect(attached_file).to receive(:title).and_return("title")
      expect(subject.title).to eq("title")
    end
  end


  describe 'body' do

    it "returns the body if there is a body" do
      expect(attached_file).to receive(:body).and_return("body")
      expect(subject.body).to eq("body")
    end
  end
end
