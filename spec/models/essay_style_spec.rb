require 'spec_helper'

describe EssayStyle do
  subject { described_class.new }

  [:slug, :title].each do |field|
    it "has the ##{field} attribute" do
      expect(subject).to respond_to(field)
      expect(subject).to respond_to("#{field}=")
    end
  end
end
