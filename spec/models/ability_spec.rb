require 'spec_helper'
require 'cancan/matchers'

describe Ability do
  let(:user) { User.new }
  subject { described_class.new(user) }

  describe 'existing editor' do

    before do
      FactoryGirl.create(:editor)
    end

    describe 'can edit' do
      it 'is false with no editor' do
        expect(subject).to_not be_able_to(:edit, :all)
      end

      it 'is true with editor?' do
        user.stub(:editor?).and_return(true)
        expect(subject).to be_able_to(:edit, :all)
      end
    end

    describe 'can manage_users' do
      it 'is false with no editor' do
        expect(subject).to_not be_able_to(:manage_users, :all)
      end

      it 'is true with is_superuser?' do
        user.stub(:editor?).and_return(true)
        user.stub(:is_superuser?).and_return(true)
        expect(subject).to be_able_to(:manage_users, :all)
      end
    end

  end

  describe 'no existing editor' do
    let(:user) { FactoryGirl.create(:user) }

    it 'creates an editor with superuser permission when no editors exist' do
      expect(user.is_superuser?).to be_false
      expect{ described_class.new(user) }.to change{Editor.count}.by(1)
      expect(user.is_superuser?).to be_true
    end
  end
end
