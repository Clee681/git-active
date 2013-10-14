class User
  attr_accessor :name
  
  @@users = []

  def initialize(name)
    @@users << self
    self.name = name
  end

  def self.all
    @@users
  end
end