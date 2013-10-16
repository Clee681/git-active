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

  def self.build_from_db
    sql = "SELECT * FROM events ORDER BY time DESC LIMIT 3;"
    results = Database.db.execute(sql)

    output = []
    results.each do |row|
      row.tap do |e|
        e      = Event.new
        e.name = row[1]
        e.repo = row[2]
        e.type = row[3]
        e.time = row[4]
        output << e
      end
    end
    output
  end

  def initialize
    @@events << self
  end

  def self.all
    @@events
  end
end