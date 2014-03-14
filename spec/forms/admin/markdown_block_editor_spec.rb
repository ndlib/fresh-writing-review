require 'spec_helper'

describe Admin::MarkdownBlockEditor do

  let(:markdown_block) { double(MarkdownContent, id: 1, content: 'nada', images: double(ActiveRecord::Associations::CollectionProxy, create: true, find: image_file_1)) }
  let(:markdown_block_editor) { Admin::MarkdownBlockEditor.new(markdown_block) }
  let(:image_file_1) { double(Image, destroy: true) }
  let(:image_file_2) { double(Image, destroy: true) }

  describe :images do

    context :marshal_markdown_editor do

      it "should instantiate a markdown content object" do
        markdown_block_editor.markdown_block.should eq markdown_block
      end

      it "should contain the correct markdown content" do
        markdown_block_editor.markdown_content.should eq "nada"
      end

      it "should contain a proxy relation for images" do
        markdown_block_editor.images.should respond_to('find')
      end

    end
    
    context :create_new_image do
      
      it "creates a new image record" do
        expect(markdown_block.images).to receive(:create).with(:image => image_file_1)
        markdown_block_editor.add_image(image_file_1)
      end

    end

    context :remove_image do

      it "deletes the image record" do
        (markdown_block.images).should_receive(:find).with(image_file_1)
        image_file_1.should_receive(:destroy)
        markdown_block_editor.remove_image(image_file_1)
      end

    end

  end

end
