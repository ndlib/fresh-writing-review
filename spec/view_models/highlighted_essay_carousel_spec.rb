require 'spec_helper'

describe HighlightedEssayCarousel do
  let(:issue) { FactoryGirl.create(:issue) }

  subject { described_class.new(issue) }

  before do
    @highlighted_essays = [
      FactoryGirl.create(:highlighted_essay, issue: issue, essay: FactoryGirl.create(:essay, issue: issue)),
      FactoryGirl.create(:highlighted_essay, issue: issue, essay: FactoryGirl.create(:essay, issue: issue))
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

  describe '#render' do
    it 'renders' do
      expect(subject.render).to be_a_kind_of String
    end
  end
end
