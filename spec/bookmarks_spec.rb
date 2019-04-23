require 'bookmarks'

describe Bookmarks do

  describe '#all' do
    it 'displays a list of bookmark links' do
      bookmarks = [
                  "www.google.com",
                  "www.netflix.com",
                  "www.twitter.com"
                  ]
      expect(Bookmarks.all).to eq bookmarks
    end
  end
end
