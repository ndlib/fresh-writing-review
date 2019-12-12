require 'spec_helper'

describe AwardQuery do
  subject { described_class }
  let(:award) { FactoryBot.create(:award) }

  describe '#all' do
    it 'returns all essay awards' do
      FactoryBot.create_list(:award, 2)
      expect(subject.all.count).to be == 2
    end

    it "orders by title" do
      # this is not the way I want to test this but the pattern that we have set out does not allow
      # expect(subject.relation).to receive(:order).with(:title) to work
      # I am not certain exactly why but it might have to do with the way that EssayStyleQuery#relation is defined.
      FactoryBot.create_list(:award, 2)
      expect(subject.all).to eq( Award.all.order(:title))
    end
  end


  describe '#find' do
    it "returns the requested record by friendly id" do
      expect(subject.find(award.friendly_id)).to eq(award)
    end


    it "raises an error when the record doesn't exist" do
      expect{ subject.find('fake')}.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
