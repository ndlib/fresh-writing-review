require 'spec_helper'

describe HighlightedEssayCarousel do
  let(:issue) { FactoryBot.create(:issue) }

  subject { described_class.new(issue) }

  before do
    @highlighted_essays = [
      FactoryBot.create(:highlighted_essay, issue: issue, essay: FactoryBot.create(:essay, issue: issue, body: FactoryBot.create(:markdown_content))),
      FactoryBot.create(:highlighted_essay, issue: issue, essay: FactoryBot.create(:essay, issue: issue, body: FactoryBot.create(:markdown_content)))
    ]
  end

  describe '#highlighted_essays' do
    it 'returns the highlighted essays' do
      expect(subject.highlighted_essays).to be == @highlighted_essays
    end
  end

  describe '#link_to_essay' do
    it 'links to the essay path' do
      essay = @highlighted_essays.first
      expect(subject.link_to_essay(essay)).to match "/essays/#{essay.friendly_id}"
    end
  end


  describe '#body' do
    let(:text) {  "A few nights ago, I came across a family of deer on my way back to Notre Dame from St. Mary’s at midnight. Because of the late hour, I was the only person walking on the road. The only visible colors were the blackness of the night and the orange moreworkds go here" }
    let(:correct_text) {  "A few nights ago, I came across a family of deer on my way back to Notre Dame from St. Mary’s at midnight. Because of the late hour, I was the only person walking on the road. The only visible colors were the blackness of the night and the orange..." }

    let(:highligted_essay) { double(HighlightedEssay, essay: double(Essay, body: double( MarkdownContent, content: text))) }

    it "breaks after 200 characters on the word boundry" do
      expect(subject.body(highligted_essay)).to eq("<p>#{correct_text}</p>")
    end


  end

  describe '#render' do
    it 'renders' do
      expect(subject.render).to be_a_kind_of String
    end
  end
end
