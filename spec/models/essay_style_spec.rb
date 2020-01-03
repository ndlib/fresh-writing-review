require 'spec_helper'

describe EssayStyle do
  subject { described_class.new }

  [:title].each do |field|
    it "has the ##{field} attribute" do
      expect(subject).to respond_to(field)
      expect(subject).to respond_to("#{field}=")
    end
  end

  describe '#friendly_id' do
    it "is based on the title" do
      subject.title = 'Test'
      subject.save
      expect(subject.friendly_id).to be == 'test'
    end
  end

  describe '#essays' do
    subject { FactoryBot.create(:essay_style) }

    it 'has many essays' do
      expect{ FactoryBot.create_list(:essay, 2, essay_style_id: subject.id) }.to change{ subject.essays.count }.by(2)
    end
  end
end
