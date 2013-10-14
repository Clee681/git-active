require 'octokit'
require 'pry'
require_relative './event'
require_relative './api_caller'
require_relative './user'

api = ApiCaller.new
api.call


# Database to persist events from each api call
# Users class to tally points
# Need to get image url
