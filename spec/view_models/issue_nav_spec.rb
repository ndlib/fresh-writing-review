require 'spec_helper'

describe IssueNav do
  let(:issue) { FactoryGirl.create(:issue) }

  subject { described_class.new(issue) }

  describe '#year' do
    it 'is the issue year' do
      expect(subject.year).to be == issue.year
    end
  end

  describe '#link_to_show' do
    it 'links to an issue show page' do
      expect(subject.link_to_show).to match "/issues/#{issue.year}"
    end
  end

  describe '#link_to_editorial_notes' do
    it 'links to an issue show page' do
      expect(subject.link_to_editorial_notes).to match "/issues/#{issue.year}/note"
    end
  end

  describe '#link_to_editorial_board' do
    it 'links to an issue show page' do
      expect(subject.link_to_editorial_board).to match "/issues/#{issue.year}/editorial-board"
    end
  end

  describe '#link_to_acknowledgments' do
    it 'links to an issue show page' do
      expect(subject.link_to_acknowledgments).to match "/issues/#{issue.year}/acknowledgments"
    end
  end
end
