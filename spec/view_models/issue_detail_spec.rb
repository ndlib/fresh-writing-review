require 'spec_helper'

describe IssueDetail do
  let(:issue) { double(Issue, id: 1, year: 'year', friendly_id: 'fid', title: 'title', acknowledgements: 'ack', editorial_notes: 'edn', editorial_board: 'eb') }
  let(:controller) { double(ApplicationController, params: ActionController::Parameters.new(id: issue.friendly_id)) }

  subject { described_class.build(controller) }

  before(:each) do
    IssueQuery.stub(:find).and_return(issue)
  end

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

  describe '#acknowledgements' do
    it 'formats the issue acknowledgements' do
      expect(MarkDownConverter).to receive(:call).with(issue.acknowledgements)
      subject.acknowledgements
    end
  end

  describe '#link_to_show' do
    it 'links to an issue show page' do
      expect(subject.link_to_show).to eq("<a class=\"\" href=\"/issues/fid\">title</a>")
    end

    it "allows you to add the css to the link" do
      expect(subject.link_to_show('css')).to eq("<a class=\"css\" href=\"/issues/fid\">title</a>")
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

  describe 'self#current' do
    it 'returns the most recent issue' do
      expect(IssueQuery).to receive(:current)
      described_class.current
    end
  end
end
