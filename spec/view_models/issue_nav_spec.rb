require 'spec_helper'

describe IssueNav do
  let(:issue) { FactoryBot.create(:issue) }

  subject { described_class.new(issue) }

  describe '#year' do
    it 'is the issue year' do
      expect(subject.year).to be == issue.year
    end
  end

  describe '#link_to_show' do
    it 'links to an issue show page' do
      expect(subject.link_to_show).to match "/volumes/#{issue.year}"
    end
  end

  describe '#link_to_editorial_notes' do
    it 'links to an issue show page' do
      expect(subject.link_to_editorial_notes).to match "/volumes/#{issue.year}/note"
    end
  end

  describe '#link_to_editorial_board' do
    it 'links to an issue show page' do
      expect(subject.link_to_editorial_board).to match "/volumes/#{issue.year}/editorial-board"
    end
  end

  describe '#link_to_acknowledgements' do
    it 'links to an issue show page' do
      expect(subject.link_to_acknowledgements).to match "/volumes/#{issue.year}/acknowledgements"
    end
  end


  describe '#essay_styles' do
    it 'calls EssayStyleQuery' do
      expect(EssayStyleQuery).to receive(:all).and_return([])
      subject.essay_styles
    end
  end


  describe '#awards' do
    it 'calls AwardQuery' do
      expect(AwardQuery).to receive(:all).and_return([])
      subject.awards
    end
  end



  describe '#render' do
    it 'renders' do
      expect(subject.render).to be_a_kind_of String
    end
  end
end
