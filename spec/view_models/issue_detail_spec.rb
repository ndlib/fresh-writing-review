require 'spec_helper'

describe IssueDetail do
  let(:issue) { FactoryGirl.create(:issue) }
  let(:controller) { double(ApplicationController, params: ActionController::Parameters.new(id: issue.year)) }

  subject { described_class.build(controller) }

  describe '#year' do
    it 'is the issue year' do
      expect(subject.year).to be == issue.year
    end
  end
end
