require 'spec_helper'

feature 'Search Twitter for a term' do
  scenario 'searching by a hashtag' do
    visit root_path
    fill_in 'Search', with: 'Rails'
    click_button 'Search'
    expect(page).to have_css 'li.tweet', count: 15
	 
	 all('li.tweet').each do |tweet|
	 	expect(tweet.text).to match /#rails/i
	 end
  end
end
