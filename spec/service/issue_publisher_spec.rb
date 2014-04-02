require 'spec_helper'

describe IssuePublisher do
  let(:issue) { FactoryGirl.create(:issue) }
  describe 'instance' do
    subject { described_class.new(issue) }
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
