require 'spec_helper'

describe EssayStyle do
  subject { FactoryGirl.build(:essay_style) }

  [:title].each do |field|
    it "has the ##{field} attribute" do
      expect(subject).to respond_to(field)
      expect(subject).to respond_to("#{field}=")
    end
  end

  describe '#friendly_id' do
    it "is based on the title" do
      expect(subject.friendly_id).to be == subject.title.downcase
    end
  end
end
