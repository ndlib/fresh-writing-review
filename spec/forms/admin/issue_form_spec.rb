require 'spec_helper'


describe Admin::IssueForm do

  subject { described_class.new(Issue.new) }

  let(:new_controller) { double(ApplicationController, params: {} ) }
  let(:edit_controller) { double(ApplicationController, params: {id: 1} ) }

  describe 'build' do
    before(:each) do
      IssueQuery.stub(:find).with(1).and_return(double(Issue, id: 1, new_record?: false, attributes: {} ))
      Issue.stub(:first).and_return(double(Issue, id: 1, new_record?: false, attributes: {} ))
    end


    it "creates a new issue if no id is passed in" do
      form = Admin::IssueForm.build(new_controller)
      expect(form.issue.new_record?).to be true
    end


    it "uses the issue of the id passed in" do
      form = Admin::IssueForm.build(edit_controller)
      expect(form.issue.new_record?).to be false
    end
  end


  ['title', 'year'].each do | field |
    it "has the ##{field} attribute" do
      expect(subject).to respond_to(field)
      expect(subject).to respond_to("#{field}=")
    end
  end

  describe 'validations' do
    let(:issue) { Issue.new }
    let(:valid_params) { { title: 'title', year: 2010 }}
    let(:invalid_admin_issue_form) { Admin::IssueForm.new(issue, {}) }
    subject { described_class.new(issue, valid_params) }


    it "checks that there are unique years" do
      Issue.new(title: 'title2', year: 2010).save!
      subject.save!
      expect( subject.errors[:year].size).to eq(1)
    end

    it "validates the presence of title" do
      invalid_admin_issue_form.valid?
      expect(invalid_admin_issue_form.errors[:title].size).to eq(1)
    end

    it "validates the presence of year" do
      invalid_admin_issue_form.valid?
      expect(invalid_admin_issue_form.errors[:year].size).to eq(1)
    end
  end


  describe 'new_record' do

    subject { described_class.new(issue, valid_params) }

    let(:issue) { Issue.new }
    let(:valid_params) { { title: 'title', year: 'year' }}
    let(:invalid_params) { { }}


    before(:each) do
      CopyPreviousIssuePages.stub(:call).and_return(true)
    end

    it "saves with valid params" do
      expect(issue).to receive(:save!)
      subject.save!
    end


    it "does not save with invalid params " do
      expect(issue).to_not receive(:save!)
      described_class.new(issue, invalid_params)
    end


    it "calls copy previous issue pages" do
      expect(CopyPreviousIssuePages).to receive(:call)
      subject.save!
    end

    it "creates unpublished issues" do
      subject.save!

      expect(subject.issue).to_not be_published
    end
  end
end
