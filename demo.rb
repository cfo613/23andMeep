# These gems make calling the API a piece of cake
require 'sinatra'
require 'rest-client'
require 'json'
require 'pry'

# This is the base URL -- we'll add endpoints to it for specific data
base_url = "https://api.23andme.com/1/demo"
# This is the demo token, that gives you access to simulated data
token = "fdab6a6892b198e40c2484bf2121f761"

headers = {Authorization: "Bearer #{token}"}


class Person
  attr_accessor :id, :first_name, :last_name
end

# Instantiate a new Person:
person = Person.new

# Get the data from the /names/ endpoint,
# using the authentication headers
response = RestClient.get base_url + "/names/", headers=headers

# Use JSON.load to put the response into the data variable:
data = JSON.load(response)

# profiles is an array.
profiles = data["profiles"]

# set the person's id, first_name, and last_name, to match first profile's id, first_name, and last_name
person.id = profiles[0]["id"]
person.first_name = profiles[0]["first_name"]
person.last_name = profiles[0]["last_name"]

puts "Hello, #{person.first_name} #{person.last_name}!"


response = RestClient.get base_url + "/grfs/#{person.id}", headers=headers
data = JSON.load response

binding.pry

get '/' do
  content_type :json
  data.to_json
end

#
# traits.each do |trait|
#   puts JSON.pretty_generate trait
# end
