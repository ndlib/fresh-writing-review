require 'spec_helper'


describe Essay do

  before(:each) do
    @issue = Essay.new
  end

  it "has the essay attributes" do
    ['title', 'body', 'issue', 'embed', 'images'].each do | attr |
      expect(@issue.respond_to?(attr)).to be_true
      expect(@issue.respond_to?("#{attr}=")).to be_true
    end
  end

end
