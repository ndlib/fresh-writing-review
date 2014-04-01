require 'spec_helper'

describe Editor do
  describe 'factory' do
    subject { FactoryGirl.create(:editor) }

    it 'has a user' do
      expect(subject.user).to be_a_kind_of(User)
    end
  end
end
