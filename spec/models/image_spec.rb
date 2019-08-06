require 'spec_helper'

describe Image do

  let(:image_object) { Image.new }
  let(:image_file_1) { File.open(Rails.root.join('spec/fixtures/images/test_image_1.jpg'), 'rb') }
  let(:image_file_2) { File.open(Rails.root.join('spec/fixtures/images/test_image_2.jpg'), 'rb') }

  context 'create_new_images' do

    it "should ingest a new image file" do
      image_object.image = image_file_1
      image_object.should have_attached_file(:image)
    end

    it "should validate image presence" do
      image_object.image = image_file_1
      image_object.should validate_attachment_presence(:image)
    end

    it "should store the file correctly" do
      image_object.image = image_file_1
      image_object.save!
      FileTest.exist?(Rails.root.join("public/system/images/#{image_object.id}/original/test_image_1.jpg")).should be_truthy
    end

    it "should validate the file type" do
      image_object.image = image_file_2
      image_object.should validate_attachment_content_type(:image).allowing('image/jpeg', 'image/jpg', 'image/png').rejecting('text/plain', 'text/xml')
    end

  end
end
