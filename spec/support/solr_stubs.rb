module SolrStubs
  def add_solr_stubs
    Essay.any_instance.stub(:perform_index_tasks).and_return(true)
    Essay.any_instance.stub(:remove_from_index)

  end

  def remove_solr_stubs
    Essay.any_instance.unstub(:perform_index_tasks)
    Essay.any_instance.unstub(:remove_from_index)
  end
end
