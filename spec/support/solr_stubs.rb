module SolrStubs
  def add_solr_stubs
    Essay.any_instance.stub(:perform_index_tasks).and_return(true)
  end

  def remove_solr_stubs
    Essay.any_instance.unstub(:perform_index_tasks)
  end
end
