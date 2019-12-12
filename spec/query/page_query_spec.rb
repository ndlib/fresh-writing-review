require 'spec_helper'

describe PageQuery do
  subject { described_class }
  let(:page) { FactoryBot.create(:page) }

  describe '#all' do
    it 'returns all pages' do
      FactoryBot.create_list(:page, 2)
      expect(subject.all.count).to be == 2
    end
  end

  describe '#find' do
    it "returns the requested record by friendly id" do
      expect(subject.find(page.friendly_id)).to eq(page)
    end


    it "raises an error when the record doesn't exist" do
      expect{ subject.find('fake')}.to raise_error(ActiveRecord::RecordNotFound)
    end
  end

  describe '#submission_guidelines' do
    it 'calls find with submission_guidelines' do
      expect(subject).to receive(:find).with('submission_guidelines')
      subject.submission_guidelines
    end
  end
end
