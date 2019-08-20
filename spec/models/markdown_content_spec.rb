require 'spec_helper'

describe MarkdownContent do

  let(:existing_markdown_block) { double(MarkdownContent, id: 1, content: 'nada', images: double(ActiveRecord::Associations::CollectionProxy, create: true, find: true)) }
  let(:markdown_block) { MarkdownContent.new(:content => "**TEST**") }

  context 'new_markdown_content' do

    it "sets content to an empty string when nil" do
      markdown_block.content = nil
      markdown_block.valid?
      expect(markdown_block.content).to be == ""
    end

    it "validates content" do
      markdown_block.valid?.should be_truthy
    end

  end

  context 'image_associations' do

    it "responds with the number of existing image associations" do
      markdown_block.should respond_to(:images)
    end

  end

end
