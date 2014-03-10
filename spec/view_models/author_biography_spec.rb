require 'spec_helper'


describe AuthorBiographyDetail do

  let(:essay) { double(Essay, author: 'author', author_biography: 'biography' ) }
  subject { described_class.new(essay) }

  it "reutrns the author name" do
    expect(subject.name).to eq("author")
  end

  it "returns the markdown" do
    expect(subject.markdown).to eq("<p>biography</p>\n")
  end


  it "returns the image" do
    expect(subject.image).to eq("<img alt=\"Author\" src=\"/assets/author.jpg\" width=\"50px\" />")
  end

end

