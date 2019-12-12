require 'spec_helper'

describe Editor do
  describe 'factory' do
    subject { FactoryBot.create(:editor) }

    it 'has a user' do
      expect(subject.user).to be_a_kind_of(User)
    end
  end

  describe '#strip_whitespace' do
    it 'is called during validation' do
      expect(subject).to receive(:strip_whitespace)
      subject.valid?
    end

    it 'strips whitespace from the username' do
      subject.username = ' test '
      subject.strip_whitespace
      expect(subject.username).to be == 'test'
    end
  end
end
