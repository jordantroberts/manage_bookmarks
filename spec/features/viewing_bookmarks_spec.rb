feature 'Viewing bookmarks' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Bookmark Manager"
  end

  scenario 'a user can see bookmark list' do
    visit('/')
    click_button('See Bookmarks')
    expect(page).to have_content "www.google.com"
    expect(page).to have_content "www.netflix.com"
    expect(page).to have_content "www.twitter.com"
  end
end
