require 'spec_helper'


describe Essay do

  subject { Essay.new }

  it "has the essay attributes" do
    ['title', 'body', 'issue', 'embed', 'template', 'alt_body', 'alt_title', 'author', 'author_biography', 'works_cited', 'discussion_questions'].each do | attr |
      expect(subject.respond_to?(attr)).to be_true
      expect(subject.respond_to?("#{attr}=")).to be_true
    end
  end


  it "validates the title" do
    expect(subject).to have(1).error_on(:title)
  end


  it "creates a slug from the title" do
    subject.title = "title"
    subject.save

    expect(subject.friendly_id).to eq("title")
  end


end
