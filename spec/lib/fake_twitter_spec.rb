require 'spec_helper'
# .search is the class method and search will return an object with results. Calls FakeTwitter and fake.results to be an Array

describe FakeTwitter, '.search' do
	it 'returns an object with a list of results' do
		fake = FakeTwitter.search('term')
		expect(fake.results).to be_an(Array)
	end
end

describe FakeTwitter, '.[]=' do
  it 'returns twitter statuses with the correct data when looking at results' do
    FakeTwitter['term'] = [{ 'text' => 'great' }]
    results = FakeTwitter.search('term').results
    expect(results).to be_an(Array)
    expect(results.length).to eq 1
    expect(results.first).to be_a Twitter::Status
  end
end

describe FakeTwitter, '.clear' do
  it 'cleas out the results' do
    FakeTwitter['term'] = [{ 'text' => 'great' }]
    FakeTwitter.clear
    results = FakeTwitter.search('term').results
    expect(results).to be_empty
  end
end
