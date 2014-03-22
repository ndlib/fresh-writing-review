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

  describe '#link_to_acknowledgements' do
    it 'links to an issue show page' do
      expect(subject.link_to_acknowledgements).to match "/issues/#{issue.year}/acknowledgements"
    end
  end


  describe '#essay_styles' do
    it 'calls EssayStyleQuery' do
      expect(EssayStyleQuery).to receive(:all).and_return([])
      subject.essay_styles
    end
  end


  describe '#essay_awards' do
    it 'calls EssayAwardQuery' do
      expect(EssayAwardQuery).to receive(:all).and_return([])
      subject.essay_awards
    end
  end



  describe '#render' do
    it 'renders' do
      expect(subject.render).to be_a_kind_of String
    end
  end
end
