class Event
  attr_accessor :name, :repo, :type, :time
  @@events = []

  Database.db.execute("CREATE TABLE IF NOT EXISTS events
                (id INTEGER PRIMARY KEY AUTOINCREMENT,
                name TEXT,
                repo TEXT,
                type TEXT,
                time DATETIME);"
              )

  def insert
    sql = "INSERT INTO events (name, repo, type, time) VALUES (?,?,?,?)"
    Database.db.execute(sql, self.name, self.repo, self.type, self.time)
  end

  def build_from_db
    
  end

  def initialize
    @@events << self
  end

  def self.all
    @@events
  end
end