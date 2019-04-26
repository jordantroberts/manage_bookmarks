require 'pg'

def remove_bookmarks
  c = PG.connect(dbname: 'bookmark_manager_test')
  c.exec("TRUNCATE bookmarks;")
end
