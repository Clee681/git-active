require 'octokit'
require 'pry'
require_relative './event'

client = Octokit::Client.new :netrc => true
client.login

api_results = client.organization_events('flatiron-school')

output = api_results.collect do |element|
  event       = Event.new
  event.name  = element.attrs[:actor].attrs[:login]
  event.repo  = element.attrs[:repo].attrs[:name]
  event.type  = element.attrs[:type]
  event.time  = element.attrs[:created_at]
  event
end

output

binding.pry


