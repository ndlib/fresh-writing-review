require 'spec_helper'

describe PageQuery do
  subject { described_class }
  let(:page) { FactoryGirl.create(:page) }

  describe '#all' do
    it 'returns all pages' do
      FactoryGirl.create_list(:page, 2)
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
end
