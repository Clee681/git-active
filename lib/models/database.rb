class Database
  @@db = SQLite3::Database.new 'git_active.db'

  def self.db
    @@db
  end
end