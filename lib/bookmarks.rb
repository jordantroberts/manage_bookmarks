require 'pg'

class Bookmarks

  attr_reader :id, :title, :url

  def initialize(id:, title:, url:)
    @id = id
    @title = title
    @url = url
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end

    result = connection.exec("SELECT * FROM bookmarks;")
    result.map { |bookmark| Bookmarks.new(id: bookmark['id'], url: bookmark['url'], title: bookmark['title']) }
  end

  def self.create(url:, title:)
    #return false unless is_url?(url)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end

    result = connection.exec("INSERT INTO bookmarks (url, title) VALUES ('#{url}', '#{title}') RETURNING id, url, title;")
    Bookmarks.new(id: result[0]['id'], url: result[0]['url'], title: result[0]['title'])

  end
end
