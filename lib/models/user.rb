class User
  attr_accessor :name, :avatar
  
  @@users = []

  # @@db = SQLite3::Database.new 'users.db'
  # @@db.execute("CREATE TABLE IF NOT EXISTS users
  #               (id INTEGER PRIMARY KEY AUTOINCREMENT,
  #               name TEXT,
  #               avatar TEXT);"
  #             )

  def initialize(name)
    @@users << self
    self.name   = name
    # self.avatar = avatar
  end

  def self.all
    @@users
  end

  def self.find(name)
    self.all.select { |u| u.name == name  }.first
  end
end