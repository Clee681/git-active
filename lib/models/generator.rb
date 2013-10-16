class Generator

  def self.get_three_recent
    Database.build_from_db
  end


  def self.get_top_scorer
    sql = "SELECT name,count(*) FROM events GROUP BY name ORDER BY count(name) DESC LIMIT 1;"
    result = Database.db.execute(sql).flatten
    result
  end
end