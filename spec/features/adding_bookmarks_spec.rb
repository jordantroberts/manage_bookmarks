require 'pg'

feature 'adding a new bookmark' do
  scenario 'creates a bookmark' do

    connection = PG.connect(dbname: 'bookmark_manager_test')
    connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.asos.com');")

      visit('/bookmarks')
      click_link 'Add Bookmark'
      fill_in 'url', with: 'www.asos.com'
      click_button 'Submit'
      expect(page).to have_content 'www.asos.com'

  end
end
