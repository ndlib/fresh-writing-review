require 'spec_helper'

describe StripDownConverter do

  subject { described_class }

  describe '#call' do
    it 'returns an empty string for nil' do
      expect(subject.call(nil)).to be == ""
    end

    it 'removes markdown formatting' do
      expect(subject.call("# Header\n")).to be == "Header\n"
    end
  end
end
