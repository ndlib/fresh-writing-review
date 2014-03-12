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
    it 'formats the issue editorial_notes' do
      expect(MarkDownConverter).to receive(:call).with(issue.editorial_notes)
      subject.editorial_notes
    end
  end

  describe '#editorial_board' do
    it 'formats the issue board' do
      expect(MarkDownConverter).to receive(:call).with(issue.editorial_board)
      subject.editorial_board
    end
  end

  describe '#acknowledgments' do
    it 'formats the issue acknowledgments' do
      expect(MarkDownConverter).to receive(:call).with(issue.acknowledgments)
      subject.acknowledgments
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

  describe '#render_nav' do
    it 'calls IssueNav#render' do
      expect(subject.issue_nav).to receive(:render)
      subject.render_nav
    end
  end

  describe '#render_carousel' do
    it 'calls HighlightedEssayCarousel#render' do
      expect(subject.highlighted_essay_carousel).to receive(:render)
      subject.render_carousel
    end
  end
end
