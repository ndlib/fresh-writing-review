require 'spec_helper'

describe HighlightedEssayDetail do
  let(:issue) { FactoryBot.create(:issue) }
  let(:essay_style) { FactoryBot.create(:essay_style) }
  let(:essay) { FactoryBot.create(:essay, issue: issue, essay_style: essay_style) }

  subject { described_class.new(issue, essay_style) }

  before do
    @highlighted_essay = FactoryBot.create(:highlighted_essay, issue: issue, essay_style: essay_style, essay: essay)
  end

  describe '#title' do
    it 'is the essay title' do
      expect(subject.title).to be == @highlighted_essay.title
    end
  end

  describe '#present?' do
    it 'is true' do
      expect(subject.present?).to be_truthy
    end

    it 'is false when there is no highlighted essay' do
      @highlighted_essay.destroy
      expect(subject.present?).to be_falsey
    end
  end

  describe '#link_to_essay' do
    it 'links to the essay path' do
      expect(subject.link_to_essay).to match "/essays/#{essay.friendly_id}"
    end
  end
end
