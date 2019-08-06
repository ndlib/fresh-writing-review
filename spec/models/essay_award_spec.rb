require 'spec_helper'

describe EssayAward do
  it "has essay award attributes" do
    %w(essay award placement).each do | attr |
      expect(subject.respond_to?(attr)).to be_truthy
      expect(subject.respond_to?("#{attr}=")).to be_truthy
    end
  end

  describe '#placement_string' do
    it 'is nil without a placement' do
      subject.placement = nil
      expect(subject.placement_string).to be_nil
    end

    it 'ordinalizes the placement' do
      subject.placement = 1
      expect(subject.placement_string).to be == '1st'
    end
  end
end
