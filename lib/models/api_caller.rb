class ApiCaller
  attr_accessor :time, :client

  def initialize
    self.time = Time.now.utc
    # self.time = Time.utc(2013,10,12,21,40,00)
    self.client = Octokit::Client.new :netrc => true
  end

  def call
    
    while true
      self.client.login

      api_results = self.client.organization_events('flatiron-school')
      api_results.each do |api_hash|

        if api_hash.attrs[:created_at] > self.time #&& api_hash.attrs[:type] == "PushEvent"
          event_to_insert = Event.new.tap do |event|

                name_from_event = api_hash.attrs[:actor].attrs[:login]
                user_name = User.find(name_from_event) || User.new(name_from_event)
                
                event.name   = user_name.name.to_s
                event.repo   = api_hash.attrs[:repo].attrs[:name]
                event.type   = api_hash.attrs[:type]
                event.time   = api_hash.attrs[:created_at].to_s
                puts "#{api_hash.attrs[:actor].attrs[:login]} at #{api_hash.attrs[:created_at]}"

          end

          Database.insert(event_to_insert)
        end

      end

      self.time    = Time.now.utc
      puts "Monitoring... #{Time.now.hour}:#{Time.now.min}"
      Generator.build_site
      sleep 120
    end
  end

end