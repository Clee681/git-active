class ApiCaller
  attr_accessor :time, :client

  def initialize
    # self.time = Time.now.utc
    self.time = Time.utc(2013,10,12,21,40,00) # arbitrary time for testing purposes
    self.client = Octokit::Client.new :netrc => true
  end

  def call
    self.client.login
    
    while true
      api_results = self.client.organization_events('flatiron-school')

      # what gets added dependent on time created
      events_to_add = api_results.collect do |element|
        if element.attrs[:created_at] > self.time && element.attrs[:type] == "PushEvent"
          Event.new.tap do |event|
            user_match = User.all.select { |u| u.name == element.attrs[:actor].attrs[:login] }

            if user_match.empty?
              event.name  = User.new(element.attrs[:actor].attrs[:login])
            else
              event.name = user_match.first
            end
            
            event.repo  = element.attrs[:repo].attrs[:name]
            event.type  = element.attrs[:type]
            event.time  = element.attrs[:created_at]
            puts "#{element.attrs[:actor].attrs[:login]} at #{element.attrs[:created_at]}"
          end
        end
      end

      
      self.time = Time.now.utc
      binding.pry
      sleep 120
    end
  end
end