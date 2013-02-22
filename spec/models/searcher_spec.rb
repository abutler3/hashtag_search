require 'spec_helper'

describe Searcher, '#results' do
	it 'returns results from a twitter search' do
		searcher = Searcher.new('awesome search')
		expect(searcher.results.length).to eq 15
	end
end
