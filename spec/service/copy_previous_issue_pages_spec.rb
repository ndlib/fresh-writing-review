require 'spec_helper'

describe CopyPreviousIssuePages do

  let(:issue) { Issue.create(title: 'title', year: 'year') }
  let(:old_issue) { double(Issue, acknowledgements: acknowledgements, editorial_board: editorial_board, editorial_notes: editorial_notes) }
  let(:acknowledgements) { double(MarkdownContent, content: 'body') }
  let(:editorial_board) { double(MarkdownContent, content: 'body') }
  let(:editorial_notes) { double(MarkdownContent, content: 'body') }
  let(:old_content) { FactoryBot.create(:markdown_content, content: 'old_content') }

  subject { described_class.new(issue) }

  before(:each) do
    IssueQuery.stub(:previous_issue).and_return(old_issue)
  end

  describe 'copy!' do

    it "saves the issue when the copy is complete" do
      expect(issue).to receive(:save!)
      subject.copy!
    end

    it "copies acknowledgements when the record does not have acknowledgements " do
      subject.copy!
      expect(issue.acknowledgements.content).to eq("body")
    end

    it "does not copy acknowledgements when the record does not exist " do
      issue.acknowledgements = old_content

      subject.copy!
      expect(issue.acknowledgements.content).to eq("old_content")
    end

    it "copies it when the record does not have editorial_board " do
      subject.copy!
      expect(issue.editorial_board.content).to eq("body")
    end

    it "does not copy editorial_board when the record does not exist " do
      issue.editorial_board = old_content

      subject.copy!
      expect(issue.editorial_board.content).to eq("old_content")
    end

    it "copies it when the record does not have editorial_notes " do
      subject.copy!
      expect(issue.editorial_notes.content).to eq("body")
    end

    it "does not copy editorial_notes when the record does not exist " do
      issue.editorial_notes = old_content

      subject.copy!
      expect(issue.editorial_notes.content).to eq("old_content")
    end
  end
end
