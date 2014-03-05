require 'spec_helper'

describe IssueQuery do
  subject { described_class }
  describe '#all' do
    it 'returns all issues' do
      FactoryGirl.create_list(:issue, 2)
      expect(subject.all.count).to be == 2
    end

    it 'orders by year' do
      expect(Issue).to receive(:order).with(year: :desc)
      subject.all
    end
  end
end
