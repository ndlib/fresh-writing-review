require 'spec_helper'

describe IssueList do
  let(:issue) { FactoryGirl.create(:issue) }
  let(:controller) { double(ApplicationController) }

  subject { described_class.build(controller) }

  it 'responds to #each' do
    expect(subject).to respond_to(:each)
  end

  describe '#link_to_issue' do
    it 'links to an issue show page' do
      expect(subject.link_to_issue(issue)).to match "/issues/#{issue.year}"
    end
  end
end