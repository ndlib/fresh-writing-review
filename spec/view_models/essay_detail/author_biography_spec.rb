require 'spec_helper'

describe EssayDetail::AuthorBiography do

  let(:essay) { double(Essay, author: 'author', author_biography: double(MarkdownContent, content: 'biography'), author_image: double(Image, url: 'url')) }
  subject { described_class.new(essay) }


  describe 'self_render' do

    it "instanciates itself and renders" do
      described_class.any_instance.should_receive(:render)

      described_class.render(essay)
    end

  end


  it "has an essay " do
    expect(subject.essay).to eq(essay)
  end


  it "reutrns the author name" do
    expect(subject.name).to eq("author")
  end


  it "returns the markdown" do
    expect(subject.markdown).to match "<p>biography</p>"
  end


  it "returns the image" do
    expect(subject.image).to eq("<img alt=\"author\" src=\"/images/url\" />")
  end


  describe 'render' do
    context 'has_discussion_questions' do

      it "renders the template " do
        expect(subject).to receive(:render_to_string).with('/essays/author_biography', { object: subject })

        subject.render
      end

      it "renders with out error " do
        expect { subject.render }.to_not raise_error
      end
    end

    context 'no_work_cited' do
      let(:essay) { double(Essay, author_biography: double(MarkdownContent, content: nil), author: 'author') }

      it "does not render the template" do
        expect(subject).to_not receive(:render_to_string)
        subject.render
      end
    end
  end

end

