class Database
  @@db = SQLite3::Database.new '../../db/git_active.db'

  def self.db
    @@db
  end
end