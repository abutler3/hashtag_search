require 'spec_helper'

feature 'Search Twitter for a term' do
  scenario 'searching by a hashtag' do
    search_for 'Rails'
    expect(page).to have_css 'li.tweet', count: 15

	 all('li.tweet').each do |tweet|
	 	expect(tweet.text).to match /#rails/i
	 end
  end

  scenario 'searching with known results' do
    Searcher.searcher = FakeTwitter
    FakeTwitter['#Rails'] = 3.times.map { { text: 'Testing is awesome' } }

    search_for 'Rails'
    expect(page).to have_css 'li.tweet', count: 3, text: 'Testing is awesome'
  end

  def search_for(term)
    visit root_path
    fill_in 'Search', with: term
    click_button 'Search'
  end
end
