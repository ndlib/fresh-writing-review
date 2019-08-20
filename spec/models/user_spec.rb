require 'spec_helper'

describe User do
  subject { described_class.new }

  [:username].each do |field|
    it "has the ##{field} attribute" do
      expect(subject).to respond_to(field)
      expect(subject).to respond_to("#{field}=")
    end
  end

  describe '#editor?' do
    it 'is false with no editor' do
      expect(subject.editor?).to be_falsey
    end

    it 'is true with an editor' do
      subject.editor = Editor.new
      expect(subject.editor?).to be_truthy
    end
  end

  describe '#is_superuser?' do
    it 'is false with no editor' do
      expect(subject.is_superuser?).to be_falsey
    end

    it 'is false with an editor without superuser permission' do
      subject.editor = Editor.new(is_superuser: false)
      expect(subject.is_superuser?).to be_falsey
    end

    it 'is true with an editor with superuser permission' do
      subject.editor = Editor.new(is_superuser: true)
      expect(subject.is_superuser?).to be_truthy
    end
  end
end
