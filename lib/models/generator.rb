class Generator

  def self.get_three_recent_events
    Database.build_from_db
  end


  def self.get_top_scorer
    sql = "SELECT name,count(*) FROM events GROUP BY name ORDER BY count(name) DESC LIMIT 1;"
    result = Database.db.execute(sql).flatten
    result
  end

  def self.parse_hours(time)
    time > 12 ? (time - 12) : time
  end

  def self.convert_utc_to_local(time_string)
    time = Time.parse(time_string).getlocal
    "#{parse_hours(time.hour)}:#{time.min}:#{time.min}"
  end

  def self.build_site

    events = get_three_recent_events
    scorer = get_top_scorer

    index = ERB.new(File.open("lib/views/index.erb").read)
    File.open("_site/index.html", 'w+') do |f|
      f << index.result(binding)
    end
  end

end