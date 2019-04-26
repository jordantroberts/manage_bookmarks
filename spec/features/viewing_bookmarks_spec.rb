require 'pg'

feature 'visiting the homepage' do
  scenario 'the page title is visible' do
    visit('/')

    expect(page).to have_content "Bookmark Manager"
  end
end

feature 'viewing bookmarks' do
  scenario 'a user can see bookmark list' do

    Bookmarks.create(url: 'http://www.makersacademy.com')
    Bookmarks.create(url: 'http://destroyallsoftware.com')
    Bookmarks.create(url: 'http://www.google.com')

    visit('/bookmarks')

    expect(page).to have_content 'http://www.makersacademy.com'
    expect(page).to have_content 'http://destroyallsoftware.com'
    expect(page).to have_content 'http://www.google.com'
  end
end
