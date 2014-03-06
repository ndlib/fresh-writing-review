require 'spec_helper'

describe EssayStyleQuery do
  subject { described_class }
  let(:essay_style) { FactoryGirl.create(:essay_style) }
  describe '#all' do
    it 'returns all essay_styles' do
      FactoryGirl.create_list(:essay_style, 2)
      expect(subject.all.count).to be == 2
    end
  end

  describe '#find' do
    it "returns the requested record by friendly id" do
      expect(subject.find(essay_style.friendly_id)).to eq(essay_style)
    end


    it "raises an error when the record doesn't exist" do
      expect{ subject.find('fake')}.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
