require 'pg'

feature 'visiting the homepage' do
  scenario 'the page title is visible' do
    visit('/')

    expect(page).to have_content "Bookmark Manager"
  end
end

feature 'viewing bookmarks' do
  scenario 'a user can see bookmark list' do

    connection = PG.connect(dbname: 'bookmark_manager_test')

    connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")
    connection.exec("INSERT INTO bookmarks (url) VALUES ('http://destroyallsoftware.com');")
    connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.google.com');")
    
    visit('/bookmarks')

    expect(page).to have_content 'http://www.makersacademy.com'
    expect(page).to have_content 'http://destroyallsoftware.com'
    expect(page).to have_content 'http://www.google.com'
  end
end
