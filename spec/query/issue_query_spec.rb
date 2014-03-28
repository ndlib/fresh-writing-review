require 'spec_helper'

describe IssueQuery do
  subject { described_class }
  let(:issue) { FactoryGirl.create(:issue) }
  let(:unpublished_issue) { FactoryGirl.create(:unpublished_issue) }
  describe '#all' do
    it 'returns all issues' do
      FactoryGirl.create_list(:issue, 2)
      expect(subject.all.count).to be == 2
    end

    it "returns all reguardless of if they are published or not" do
      issue
      unpublished_issue

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

  describe '#published' do
    it 'returns all published issues' do
      FactoryGirl.create_list(:issue, 2)
      unpublished_issue
      expect(subject.published.count).to be == 2
    end


    it 'orders by year' do
      first = FactoryGirl.create(:issue, year: 2010)
      last = FactoryGirl.create(:issue, year: 2000)
      middle = FactoryGirl.create(:issue, year: 2005)
      expect(subject.published.first).to eq(first)
      expect(subject.published.last).to eq(last)
    end
  end


  describe '#current' do
    it 'returns the most recent issue' do
      current = FactoryGirl.create(:issue, year: 2010)
      FactoryGirl.create(:issue, year: 2000)
      FactoryGirl.create(:issue, year: 2005)
      expect(subject.current).to eq(current)
    end

    it "does not return an unpublished_issue" do
      unpublished_issue
      expect{ subject.current }.to raise_error(ActiveRecord::RecordNotFound)
    end

    it "raises an error when there are no issues" do
      expect{ subject.current }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end

  describe '#find' do
    it "returns the requested record by friendly id" do
      expect(subject.find(issue.friendly_id)).to eq(issue)
    end


    it "raises an error when the record doesn't exist" do
      expect{ subject.find('fake') }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
