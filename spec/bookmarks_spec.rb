require 'bookmarks'
require 'database_helpers'

describe Bookmarks do

  describe '#all' do
    it 'displays a list of bookmark links' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      # connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")
      # connection.exec("INSERT INTO bookmarks (url) VALUES ('http://destroyallsoftware.com');")
      # connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.google.com');")

      bookmark = Bookmarks.create(url: "http://makersacademy.com", title: "Makers Academy")
      Bookmarks.create(url: "http://destroyallsoftware.com", title: "Destroy All Software")
      Bookmarks.create(url: "http://google.com", title: "Google")

      bookmarks = Bookmarks.all

      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmarks
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.first.url).to eq 'http://makersacademy.com'
      expect(bookmarks.first.title).to eq 'Makers Academy'

      # expect(bookmarks).to include "http://www.makersacademy.com"
      # expect(bookmarks).to include "http://destroyallsoftware.com"
      # expect(bookmarks).to include "http://www.google.com"
    end
  end

  describe '#create' do
    it 'creates a new bookmark' do
      bookmark = Bookmarks.create(url: "www.topshop.com", title: 'Topshop')
      persisted_data = persisted_data(id: bookmark.id)

      expect(bookmark).to be_a Bookmarks
      expect(bookmark.id).to eq bookmark.id
      expect(bookmark.url).to eq 'www.topshop.com'
      expect(bookmark.title).to eq 'Topshop'
      # expect(bookmark['url']).to eq "www.topshop.com"
      # expect(bookmark['title']).to eq 'Topshop'
    end
  end
end
