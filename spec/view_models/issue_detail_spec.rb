require 'spec_helper'

describe IssueDetail do
  let(:issue) { FactoryGirl.create(:issue) }
  let(:controller) { double(ApplicationController, params: ActionController::Parameters.new(id: issue.friendly_id)) }

  subject { described_class.build(controller) }

  describe '#year' do
    it 'is the issue year' do
      expect(subject.year).to be == issue.year
    end
  end

  describe '#editorial_notes' do
    it 'is the issue notes' do
      expect(subject.editorial_notes).to be == issue.editorial_notes
    end
  end

  describe '#editorial_board' do
    it 'is the issue board' do
      expect(subject.editorial_board).to be == issue.editorial_board
    end
  end

  describe '#acknowledgments' do
    it 'is the issue acknowledgments' do
      expect(subject.acknowledgments).to be == issue.acknowledgments
    end
  end

  describe '#link_to_show' do
    it 'links to an issue show page' do
      expect(subject.link_to_show).to match "/issues/#{issue.year}"
    end
  end

  describe '#essay_styles' do
    it 'calls EssayStyleQuery' do
      expect(EssayStyleQuery).to receive(:all).and_return([])
      subject.essay_styles
    end
  end
end
