require 'spec_helper'


describe MarkDownConverter do

  subject { described_class }

  describe '#call' do
    it 'returns an empty string for nil' do
      expect(subject.call(nil)).to be == ""
    end

    it 'adds a p tag' do
      expect(subject.call('a')).to match "<p>a</p>"
    end

    it 'converts single line breaks' do
      expect(subject.call("1\n2")).to match "1<br>\n2"
    end
  end
end
