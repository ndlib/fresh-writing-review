require 'spec_helper'

describe IssuePublisher do
  let(:issue) { FactoryBot.create(:issue) }
  describe 'instance' do
    subject { described_class.new(issue) }

    describe '#publish' do
      it 'calls #set_published' do
        expect(subject).to receive(:set_published).with(true)
        subject.publish
      end
    end

    describe '#unpublish' do
      it 'calls #set_published' do
        expect(subject).to receive(:set_published).with(false)
        subject.unpublish
      end
    end

    describe '#set_published' do
      it 'changes issue#published' do
        issue.published = false
        subject.set_published(true)
        expect(issue.published).to be_truthy
      end

      it 'calls #reindex_essays' do
        expect(subject).to receive(:reindex_essays)
        subject.set_published(true)
      end

      it 'saves the issue' do
        expect(issue).to receive(:save!)
        subject.set_published(true)
      end
    end

    describe '#reindex_essays' do
      it 'calls save on the issue essays' do
        FactoryBot.create(:essay, issue: issue)
        expect(issue.essays.collect.first).to receive(:save!)
        subject.reindex_essays
      end
    end
  end

  describe 'self' do
    subject { described_class }

    describe '#publish' do
      it 'calls publish on an instance' do
        instance = described_class.new(issue)
        expect(instance).to receive(:publish)
        expect(subject).to receive(:new).with(issue).and_return(instance)
        subject.publish(issue)
      end
    end

    describe '#unpublish' do
      it 'calls unpublish on an instance' do
        instance = described_class.new(issue)
        expect(instance).to receive(:unpublish)
        expect(subject).to receive(:new).with(issue).and_return(instance)
        subject.unpublish(issue)
      end
    end
  end
end
