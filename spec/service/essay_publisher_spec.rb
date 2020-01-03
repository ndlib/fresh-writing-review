require 'spec_helper'

describe EssayPublisher do
  let(:essay) { FactoryBot.create(:essay) }
  describe 'instance' do
    subject { described_class.new(essay) }

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
      it 'changes essay#published' do
        essay.published = false
        subject.set_published(true)
        expect(essay.published).to be_truthy
      end

      it 'saves the essay' do
        expect(essay).to receive(:save!)
        subject.set_published(true)
      end
    end
  end

  describe 'self' do
    subject { described_class }

    describe '#publish' do
      it 'calls publish on an instance' do
        instance = described_class.new(essay)
        expect(instance).to receive(:publish)
        expect(subject).to receive(:new).with(essay).and_return(instance)
        subject.publish(essay)
      end
    end

    describe '#unpublish' do
      it 'calls unpublish on an instance' do
        instance = described_class.new(essay)
        expect(instance).to receive(:unpublish)
        expect(subject).to receive(:new).with(essay).and_return(instance)
        subject.unpublish(essay)
      end
    end
  end
end
