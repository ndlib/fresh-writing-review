require 'spec_helper'

describe EssayDetail::CompanionMaterial do
  def attached_file(params = {})
    double(AttachedFile, params)
  end
  let(:essay) { double(Essay, id: 1 ) }
  subject { described_class.new(essay) }

  describe 'self_render' do

    it "instanciates itself and renders" do
      described_class.any_instance.should_receive(:render)

      described_class.render(essay)
    end
  end

  describe 'has_files?' do

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
      expect(essay).to receive(:companion_material_files).and_return([file])
      expect(subject.files).to eq([file])
    end

    it "returns an empty array if the essay has no files" do
      expect(essay).to receive(:companion_material_files).and_return([])
      expect(subject.files).to eq([])
    end
  end
end
