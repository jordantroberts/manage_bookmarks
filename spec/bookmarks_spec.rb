require 'bookmarks'

describe Bookmarks do

  describe '#all' do
    it 'displays a list of bookmark links' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://destroyallsoftware.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.google.com');")

      bookmarks = Bookmarks.all
      
      expect(bookmarks).to include "http://www.makersacademy.com"
      expect(bookmarks).to include "http://destroyallsoftware.com"
      expect(bookmarks).to include "http://www.google.com"
    end
  end
end
