require 'spec_helper'

describe EssayStyleQuery do
  subject { described_class }
  let(:essay_style) { FactoryBot.create(:essay_style) }
  describe '#all' do
    it 'returns all essay_styles' do
      FactoryBot.create_list(:essay_style, 2)
      expect(subject.all.count).to be == 2
    end

    it "orders by title" do
      # this is not the way I want to test this but the pattern that we have set out does not allow
      # expect(subject.relation).to receive(:order).with(:title) to work
      # I am not certain exactly why but it might have to do with the way that EssayStyleQuery#relation is defined.
      FactoryBot.create_list(:essay_style, 2)
      expect(subject.all).to eq( EssayStyle.all.order(:title))
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
