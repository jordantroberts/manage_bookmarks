require 'pg'

feature 'visiting the homepage' do
  scenario 'the page title is visible' do
    visit('/')

    expect(page).to have_content "Bookmark Manager"
  end
end

feature 'viewing bookmarks' do
  scenario 'a user can see bookmark list' do

    Bookmarks.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')
    Bookmarks.create(url: 'http://destroyallsoftware.com', title: 'Destroy All Software')
    Bookmarks.create(url: 'http://www.google.com', title: 'Google')

    visit('/bookmarks')

    expect(page).to have_link('Makers Academy', href: 'http://www.makersacademy.com')
    expect(page).to have_link('Destroy All Software', href: 'http://destroyallsoftware.com')
    expect(page).to have_link('Google', href: 'http://www.google.com') 
  end
end
