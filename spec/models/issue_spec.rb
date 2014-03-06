require 'spec_helper'

describe Issue do
  subject { described_class.new }

  [:year, :editorial_notes, :editorial_board, :acknowledgments].each do |field|
    it "has the ##{field} attribute" do
      expect(subject).to respond_to(field)
      expect(subject).to respond_to("#{field}=")
    end
  end

  describe '#friendly_id' do
    it "is based on the year" do
      subject.year = 2014
      subject.save

      expect(subject.friendly_id).to be == '2014'
    end
  end
end
