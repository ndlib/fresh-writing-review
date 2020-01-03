require 'spec_helper'

describe PageDetail do
  let(:page) { FactoryBot.create(:page) }
  let(:controller) { double(ApplicationController, params: ActionController::Parameters.new(id: page.friendly_id)) }

  subject { described_class.build(controller) }

  describe '#title' do
    it 'is the record title' do
      expect(subject.title).to be == page.title
    end
  end

  describe '#body' do
    it 'formats the page body' do
      expect(subject.body).to be == page.body.content
    end
  end
end
