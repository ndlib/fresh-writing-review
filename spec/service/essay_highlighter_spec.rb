require 'spec_helper'

describe EssayHighlighter do
  let(:essay) { FactoryBot.create(:essay) }
  describe 'instance' do
    subject { described_class.new(essay) }

    describe '#publish' do
      it 'creates a highlighted_essay' do
        expect{subject.highlight}.to change{ HighlightedEssay.count }.by(1)
        expect(essay.highlighted_essay).to be_a_kind_of(HighlightedEssay)
      end
    end

    describe '#unhighlight' do
      it 'removes a highlighted_essay' do
        highlighted_essay = FactoryBot.create(:highlighted_essay, essay: essay)
        expect{subject.unhighlight}.to change{ HighlightedEssay.count }.by(-1)
      end
    end
  end

  describe 'self' do
    subject { described_class }

    describe '#highlight' do
      it 'calls highlight on an instance' do
        instance = described_class.new(essay)
        expect(instance).to receive(:highlight)
        expect(subject).to receive(:new).with(essay).and_return(instance)
        subject.highlight(essay)
      end
    end

    describe '#unhighlight' do
      it 'calls unhighlight on an instance' do
        instance = described_class.new(essay)
        expect(instance).to receive(:unhighlight)
        expect(subject).to receive(:new).with(essay).and_return(instance)
        subject.unhighlight(essay)
      end
    end
  end
end
