require 'spec_helper'
require 'cancan/matchers'

describe Ability do
  let(:user) { User.new }
  subject { described_class.new(user) }

  before do
    User.any_instance.stub(:create_editor!)
  end

  describe 'user' do
    it 'can not edit' do
      expect(subject).to_not be_able_to(:edit, :all)
    end

    it 'can not manage users' do
      expect(subject).to_not be_able_to(:manage_users, :all)
    end
  end

  describe 'editor' do
    let(:user) { User.new(editor: Editor.new()) }

    it 'can edit' do
      expect(subject).to be_able_to(:edit, :all)
    end

    it 'can not manage users' do
      expect(subject).to_not be_able_to(:manage_users, :all)
    end
  end

  describe 'superuser' do
    let(:user) { User.new(editor: Editor.new(is_superuser: true)) }

    it 'can edit' do
      expect(subject).to be_able_to(:edit, :all)
    end

    it 'can manage users' do
      expect(subject).to be_able_to(:manage_users, :all)
    end
  end

  describe 'automatic superuser' do
    let(:user) { FactoryGirl.create(:user) }

    it 'creates an editor with superuser permission when no editors exist' do
      User.any_instance.unstub(:create_editor!)
      expect(user.is_superuser?).to be_false
      expect{ described_class.new(user) }.to change{Editor.count}.by(1)
      expect(user.is_superuser?).to be_true
    end

  end
end
