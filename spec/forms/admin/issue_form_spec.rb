require 'spec_helper'


describe Admin::IssueForm do

  subject { described_class.new(Issue.new) }

  let(:new_controller) { double(ApplicationController, params: {} ) }
  let(:edit_controller) { double(ApplicationController, params: {id: 1} ) }

  describe :build do
    before(:each) do
      IssueQuery.stub(:find).with(1).and_return(double(Issue, id: 1, new_record?: false, attributes: {} ))
      Issue.stub(:first).and_return(double(Issue, id: 1, new_record?: false, attributes: {} ))
    end


    it "creates a new issue if no id is passed in" do
      form = Admin::IssueForm.build(new_controller)
      expect(form.issue.new_record?).to be_true
    end


    it "uses the issue of the id passed in" do
      form = Admin::IssueForm.build(edit_controller)
      expect(form.issue.new_record?).to be_false
    end
  end


  ['large_cover_image', 'small_cover_image', 'title', 'year'].each do | field |
    it "has the ##{field} attribute" do
      expect(subject).to respond_to(field)
      expect(subject).to respond_to("#{field}=")
    end
  end


  describe :save do


  end
end
