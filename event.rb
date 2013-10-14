class Event
  attr_accessor :name, :repo, :type, :time
  @@events = []

  def initialize
    @@events << self
  end

  def self.all
    @@events
  end
end