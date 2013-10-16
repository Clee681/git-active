class Event
  attr_accessor :name, :repo, :type, :time
  @@events = []

  Database.db.execute("CREATE TABLE IF NOT EXISTS events
                (id INTEGER PRIMARY KEY AUTOINCREMENT,
                name TEXT,
                repo TEXT,
                type TEXT,
                time DATETIME);")

  def initialize
    @@events << self
  end

  def self.all
    @@events
  end
end