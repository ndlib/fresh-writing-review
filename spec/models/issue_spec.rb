require 'spec_helper'

describe Issue do
  subject { described_class.new }

  [:year, :editorial_notes, :editorial_board, :acknowledgments].each do |field|
    it "has the ##{field} attribute" do
      expect(subject).to respond_to(field)
      expect(subject).to respond_to("#{field}=")
    end
  end
end
