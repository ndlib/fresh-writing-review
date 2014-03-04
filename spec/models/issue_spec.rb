require 'spec_helper'


describe Issue do

  before(:each) do
    @issue = Issue.new
  end

  it "has the issue attributes" do
    ['year'].each do | attr |
      expect(@issue.respond_to?(attr)).to be_true
      expect(@issue.respond_to?("#{attr}=")).to be_true
    end
  end

end
