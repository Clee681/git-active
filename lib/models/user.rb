class User
  attr_accessor :name, :avatar
  
  @@users = []
  
  # Database.db.execute("CREATE TABLE IF NOT EXISTS users
  #               (id INTEGER PRIMARY KEY AUTOINCREMENT,
  #               name TEXT);"
  #             )

  # def insert
  #   sql = "INSERT INTO users (name) VALUES (?)"
  #   Database.db.execute(sql, self.name)
  # end

  # def ==(event_object)
  #   self.name == event_object.name
  # end

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