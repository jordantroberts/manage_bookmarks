require 'pg'

def remove_bookmarks
  c = PG.connect(dbname: 'bookmark_manager_test')
  c.exec("DROP TABLE IF EXISTS bookmarks;")
  c.exec("CREATE TABLE bookmarks(id SERIAL PRIMARY KEY, url VARCHAR(60));")
end
