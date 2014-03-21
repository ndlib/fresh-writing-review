require 'spec_helper'

describe IssueHeader do

  let(:issue) { double(Issue, id: 1, friendly_id: 'fid', title: 'title') }
  subject { described_class.new(issue, true) }


  describe :self_render do

    it "instanciates itself and renders" do
      described_class.any_instance.should_receive(:render)

      described_class.render(issue, true)
    end
  end



  describe :full_image do
    subject { described_class.new(issue, true) }

    describe :css_class do
      it "returns the css class for the full image" do
        expect(subject.css_class).to eq("home")
      end
    end


    describe :image do

      it "returns the image for the full image" do
        expect(subject.image).to eq("<img alt=\"900x200\" src=\"http://placehold.it/900x200\" />")
      end
    end
  end


  describe :small_image do
    subject { described_class.new(issue, false) }

    describe :css_class do
      it "returns the css class for the full image" do
        expect(subject.css_class).to eq("sub")
      end
    end


    describe :image do

      it "returns the image for the full image" do
        expect(subject.image).to eq("<img alt=\"900x90\" src=\"http://placehold.it/900x90\" />")
      end
    end
  end


  describe :title do

    it "returns the title in a link" do
      expect(subject.title).to eq("<a href=\"/issues/fid\">title</a>")
    end

  end


  describe :header_image do

    it "returns the header_image in a link" do
      expect(subject.header_image).to eq("<a href=\"/issues/fid\"><img alt=\"900x200\" src=\"http://placehold.it/900x200\" /></a>")
    end
  end



  describe :render do
    it "renders the template " do
      expect(subject).to receive(:render_to_string).with('/issues/header', { object: subject })
      subject.render
    end

    it "renders with out error " do
      expect { subject.render }.to_not raise_error
    end
  end
end
