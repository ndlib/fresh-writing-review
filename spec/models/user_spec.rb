require 'spec_helper'

describe User do
  subject { described_class.new }

  [:username].each do |field|
    it "has the ##{field} attribute" do
      expect(subject).to respond_to(field)
      expect(subject).to respond_to("#{field}=")
    end
  end
end
