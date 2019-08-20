require 'spec_helper'

describe Issue do
  subject { described_class.new }


  [:title, :year, :editorial_notes, :editorial_board, :acknowledgements, :published].each do |field|
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

  describe '#is_pdf?' do
    it 'is true if is_pdf is true' do
      subject.is_pdf = true
      expect(subject.is_pdf?).to be_truthy
    end

    it 'is false if is_pdf is false' do
      subject.is_pdf = false
      expect(subject.is_pdf?).to be_falsey
    end

    it 'is false if is_pdf is nil' do
      subject.is_pdf = nil
      expect(subject.is_pdf?).to be_falsey
    end
  end


  describe 'old_cover_image' do

    it "allows you to save an old_cover_image" do
      subject.old_cover_image = File.open(Rails.root.join('spec', 'fixtures', 'images', 'covers', '2011.jpg'))
      expect(subject.old_cover_image).to be_present
    end
  end


  describe 'pdf' do

    it "allows you to save an pdf" do
      subject.pdf = File.open(Rails.root.join('spec', 'fixtures', 'files', 'issues', '2011.pdf'))
      expect(subject.pdf).to be_present
    end
  end
end
