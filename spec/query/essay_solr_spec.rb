require 'spec_helper'

describe EssaySolr do
  before do
    Sunspot::Search::StandardSearch.any_instance.stub(:execute)
  end

  it 'searches fulltext' do
    subject.stub(:params).and_return(q: 'test text')
    expect_any_instance_of(Sunspot::DSL::Search).to receive(:fulltext).with('test text')
    subject.search
  end

  it 'has facets' do
    expect_any_instance_of(Sunspot::DSL::Search).to receive(:facet).with(:essay_style_title)
    expect_any_instance_of(Sunspot::DSL::Search).to receive(:facet).with(:issue_year)
    expect_any_instance_of(Sunspot::DSL::Search).to receive(:facet).with(:medium)
    subject.search
  end

  it 'excludes essasy_style filter' do
    subject.stub(:params).and_return({style: 'Narrative'})
    expect_any_instance_of(Sunspot::DSL::Search).to receive(:facet).with(:essay_style_title, exclude: [kind_of(Sunspot::Query::Restriction::EqualTo)])
    expect_any_instance_of(Sunspot::DSL::Search).to receive(:facet).with(:issue_year)
    expect_any_instance_of(Sunspot::DSL::Search).to receive(:facet).with(:medium)
    subject.search
  end

  it 'excludes issue filter' do
    subject.stub(:params).and_return({issue: '2014'})
    expect_any_instance_of(Sunspot::DSL::Search).to receive(:facet).with(:essay_style_title)
    expect_any_instance_of(Sunspot::DSL::Search).to receive(:facet).with(:issue_year, exclude: [kind_of(Sunspot::Query::Restriction::EqualTo)])
    expect_any_instance_of(Sunspot::DSL::Search).to receive(:facet).with(:medium)
    subject.search
  end

  it 'excludes medium filter' do
    subject.stub(:params).and_return({medium: 'Traditional'})
    expect_any_instance_of(Sunspot::DSL::Search).to receive(:facet).with(:essay_style_title)
    expect_any_instance_of(Sunspot::DSL::Search).to receive(:facet).with(:issue_year)
    expect_any_instance_of(Sunspot::DSL::Search).to receive(:facet).with(:medium, exclude: [kind_of(Sunspot::Query::Restriction::EqualTo)])
    subject.search
  end

  it 'sorts' do
    expect_any_instance_of(Sunspot::DSL::Search).to receive(:order_by).with(:score, :desc)
    expect_any_instance_of(Sunspot::DSL::Search).to receive(:order_by).with(:sort_title, :asc)
    subject.search
  end
end
