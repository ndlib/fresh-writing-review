require 'spec_helper'

describe IssueList, type: :model do
  let(:controller) { double(ApplicationController) }

  subject { described_class.build(controller) }

  it 'responds to #each' do
    expect(subject).to respond_to(:each)
  end
end
