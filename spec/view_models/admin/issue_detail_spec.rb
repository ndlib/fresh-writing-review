require 'spec_helper'

describe Admin::IssueDetail do

  let(:issue) { double(Issue, id: 1, title: 'title', published?: true, is_pdf?: true )}
  subject { Admin::IssueDetail.new(issue)}

  it "has a title" do
    expect(subject.title).to eq("title")
  end


  it "displays an edit button for the issue" do
    expect(subject.edit_button).to eq("<a class=\"btn btn-primary\" href=\"/admin/volumes/1/edit\">Edit</a>")
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
