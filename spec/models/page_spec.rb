require 'spec_helper'

describe Page do
  subject { described_class.new }

  [:title, :path, :body].each do |field|
    it "has the ##{field} attribute" do
      expect(subject).to respond_to(field)
      expect(subject).to respond_to("#{field}=")
    end
  end

  describe '#friendly_id' do
    it "is based on the path" do
      subject.path = 'about'
      subject.save

      expect(subject.friendly_id).to be == 'about'
    end
  end
end
