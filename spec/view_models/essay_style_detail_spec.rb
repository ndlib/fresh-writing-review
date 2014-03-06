require 'spec_helper'

describe EssayStyleDetail do
  let(:issue) { FactoryGirl.create(:issue) }
  let(:essay_style) { FactoryGirl.create(:essay_style) }
  let(:controller) { double(ApplicationController, params: ActionController::Parameters.new(issue_id: issue.year, id: essay_style.slug)) }

  subject { described_class.build(controller) }

  describe '#title' do
    it 'is the style title' do
      expect(subject.title).to be == essay_style.title
    end
  end
end
