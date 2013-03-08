require 'spec_helper'

describe Searcher, '#results' do
	it 'returns results from a twitter search' do
		searcher = Searcher.new('awesome search')
		expect(searcher.results.length).to eq 15
	end
end

describe Searcher, 'using a custom searcher' do
  it 'invoking search returns results from the searcher passed' do
    search_results = stub('search results', results: [1,2,3])
    fake_searcher = stub('fake_searcher', search: search_results)
    Searcher.searcher = fake_searcher

    searcher = Searcher.new('term')
    expect(searcher.results).to eq search_results.results
  end
end
