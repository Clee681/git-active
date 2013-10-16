class User
  attr_accessor :name, :avatar
  
  @@users = []

  # @@db = SQLite3::Database.new 'users.db'
  # @@db.execute("CREATE TABLE IF NOT EXISTS users
  #               (id INTEGER PRIMARY KEY AUTOINCREMENT,
  #               name TEXT,
  #               avatar TEXT);"
  #             )

  def initialize(name, avatar)
    @@users << self
    self.name   = name
    self.avatar = avatar
  end

  def self.all
    @@users
  end
end