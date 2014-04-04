require 'spec_helper'


describe Award do

  subject { described_class.new }

  [:title, :essays, :essay_awards].each do |field|
    it "has the ##{field} attribute" do
      expect(subject).to respond_to(field)
      expect(subject).to respond_to("#{field}=")
    end
  end

  describe '#friendly_id' do
    it "is based on the year" do
      subject.title = 'title'
      subject.save

      expect(subject.friendly_id).to be == 'title'
    end
  end



end
