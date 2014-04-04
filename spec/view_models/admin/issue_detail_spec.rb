require 'spec_helper'

describe Admin::IssueDetail do

  let(:markdown_editor_functions) { double(Admin::MarkdownEditorFunctions, issue_content_status: 'Done', issue_content_link: '/admin/volumes/test') }
  let(:issue) { double(Issue, id: 1, title: 'title', published?: true, is_pdf?: true, essays: [1,2,3])}
  subject { Admin::IssueDetail.new(issue, markdown_editor_functions) }

  context "Issue Detail Attributes" do
    it "has an attached issue" do
      expect(subject.issue).to eq(issue)
    end

    it "has a title" do
      expect(subject.title).to eq("title")
    end

    it "#volume_title" do
      expect(subject.volume_title).to eq("title")
    end

    it "#essays" do
      # expect(subject.essays.count).to eq 3
    end

    it "#issue_id" do
      expect(subject.issue_id).to eq 1
    end
  end

  it "displays an edit button for the issue" do
    expect(subject.edit_button).to eq("<a class=\"btn btn-primary\" href=\"/admin/volumes/1/edit\">Edit</a>")
  end

  context "Content Edit Routing" do

    describe "#edit_content_status" do
      it "returns the status for content" do
        expect(subject.edit_content_status('test')).to eq("Done")
      end
    end

    describe "#edit_content_link" do
      it "returns the issue content link" do
        expect(subject.edit_content_link('test')).to eq("/admin/volumes/test")
      end
    end

  end


  describe "#published" do

    it "shows the published status when it is published" do
      expect(subject.issue_status).to eq("<span class=\"glyphicon glyphicon-eye-open\"></span> Published")
    end

    it "shows the unpublished status when it is unpublished" do
      issue.stub(:published?).and_return(false)
      expect(subject.issue_status).to eq("<span class=\"glyphicon glyphicon-eye-close\"></span> Unpublished")
    end
  end


  describe "#file_icon" do

    it "shows the file icon when there the issue is a file type" do
      expect(subject.file_icon).to eq("<span class=\"pdf glyphicon glyphicon-file\" title=\"PDF Only\"></span>")
    end

    it "shows nothing when the issues is not a file type" do
      issue.stub(:is_pdf?).and_return(false)
      expect(subject.file_icon).to eq(nil)
    end
  end

end
