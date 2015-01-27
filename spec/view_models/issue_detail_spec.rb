require 'spec_helper'

describe IssueDetail do
  let(:issue) { double(Issue, id: 1, year: 'year', friendly_id: 'fid', title: 'title', acknowledgements: double(MarkdownContent, content: 'ack'), editorial_notes: double(MarkdownContent, content: 'edn'), editorial_board: double(MarkdownContent, content: 'eb')) }
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
      expect(subject.editorial_notes).to be == issue.editorial_notes.content
    end
  end

  describe '#editorial_board' do
    it 'formats the issue board' do
      expect(subject.editorial_board).to be == issue.editorial_board.content
    end
  end

  describe '#acknowledgements' do
    it 'formats the issue acknowledgements' do
      expect(subject.acknowledgements).to be == issue.acknowledgements.content
    end
  end

  describe '#link_to_show' do
    it 'links to an issue show page' do
      expect(subject.link_to_show).to eq("<a class=\"\" href=\"/volumes/fid\">title</a>")
    end

    it "allows you to add the css to the link" do
      expect(subject.link_to_show('css')).to eq("<a class=\"css\" href=\"/volumes/fid\">title</a>")
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


  describe "#pdf_url" do
    before(:each) do
      issue.stub(:pdf).and_return(double(url: 'url'))
    end


    it " shows the pdf file if the issue is a pdf issue" do
      issue.stub(:is_pdf?).and_return(true)
      expect(subject.pdf_url).to eq("url")
    end


    it "does not give a url if it is not a pdf issue" do
      issue.stub(:is_pdf?).and_return(false)
      expect(subject.pdf_url).to eq(nil)
    end
  end
end
