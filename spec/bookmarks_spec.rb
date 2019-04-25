require 'bookmarks'
require 'setup_test_database'

describe Bookmarks do

  before(:each) do
    remove_bookmarks
  end

  describe '#all' do
    it 'displays a list of bookmark links' do
      bookmarks = Bookmarks.all
      expect(bookmarks).to include "http://www.makersacademy.com"
      expect(bookmarks).to include "http://destroyallsoftware.com"
      expect(bookmarks).to include "http://www.google.com"
    end
  end
end
