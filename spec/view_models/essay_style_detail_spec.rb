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

  describe '#year' do
    it 'is the year of the issue' do
      expect(subject.year).to be == issue.year
    end
  end

  describe '#link_to_show' do
    it 'links to the style show page' do
      expect(subject.link_to_show).to match "/issues/#{issue.year}/style/#{essay_style.slug}"
    end
  end
end
