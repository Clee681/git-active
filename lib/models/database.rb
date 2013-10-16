class Database
  @@db = SQLite3::Database.new 'git_active.db'

  def self.db
    @@db
  end

  def self.insert(event)
    sql = "INSERT INTO events (name, repo, type, time) VALUES (?,?,?,?)"
    self.db.execute(sql, event.name, event.repo, event.type, event.time)
  end

  def self.build_from_db
    sql = "SELECT * FROM events ORDER BY time DESC LIMIT 3;"
    results = self.db.execute(sql)

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


end