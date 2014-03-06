require 'spec_helper'

describe IssueQuery do
  subject { described_class }
  let(:issue) { FactoryGirl.create(:issue) }
  describe '#all' do
    it 'returns all issues' do
      FactoryGirl.create_list(:issue, 2)
      expect(subject.all.count).to be == 2
    end

    it 'orders by year' do
      first = FactoryGirl.create(:issue, year: 2010)
      last = FactoryGirl.create(:issue, year: 2000)
      middle = FactoryGirl.create(:issue, year: 2005)
      expect(subject.all.first).to eq(first)
      expect(subject.all.last).to eq(last)
    end
  end

  describe '#find' do
    it "returns the requested record" do
      expect(subject.find(issue.id)).to eq(issue)
    end


    it "raises an error when the record doesn't exist" do
      expect{ subject.find(0)}.to raise_error(ActiveRecord::RecordNotFound)
    end
  end

  describe '#year' do
    it "returns the requested record" do
      expect(subject.year(issue.year)).to eq(issue)
    end


    it "raises an error when the record doesn't exist" do
      expect{ subject.year(issue.year - 1)}.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
