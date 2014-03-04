require 'spec_helper'

describe Page do
  subject { described_class.new }

  [:issue, :slug, :title, :body].each do |field|
    it "has the ##{field} attribute" do
      expect(subject).to respond_to(field)
      expect(subject).to respond_to("#{field}=")
    end
  end
end
