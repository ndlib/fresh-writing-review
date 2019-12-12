require 'spec_helper'

describe HighlightedEssay do
  subject { described_class.new }

  let(:issue) { FactoryBot.create(:issue) }
  let(:essay) { FactoryBot.create(:essay) }
  let(:essay_style) { FactoryBot.create(:essay_style) }

  [:body].each do |field|
    it "has the ##{field} attribute" do
      expect(subject).to respond_to(field)
      expect(subject).to respond_to("#{field}=")
    end
  end

  describe '#issue' do
    it 'belongs to an issue' do
      expect(subject.issue).to be_nil
      subject.issue_id = issue.id
      expect(subject.issue).to be == issue
    end
  end

  describe '#essay' do
    it 'belongs to an essay' do
      expect(subject.essay).to be_nil
      subject.essay_id = essay.id
      expect(subject.essay).to be == essay
    end
  end

  describe '#essay_style' do
    it 'belongs to an essay style' do
      expect(subject.essay_style).to be_nil
      subject.essay_style_id = essay_style.id
      expect(subject.essay_style).to be == essay_style
    end
  end
end
