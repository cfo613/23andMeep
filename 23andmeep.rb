require 'sinatra'
require 'rest-client'
require 'json'
require 'pry'
require 'httparty'

enable :sessions
set :session_secret, 'secret_lovers'

client_id = ENV['GEN_CLIENT_ID']
client_secret = ENV['GEN_CLIENT_SECRET']
redirect_uri = 'http://localhost:4567/receive_code/'

get '/' do
  base_url = "https://api.23andme.com/authorize/"
  state = SecureRandom.urlsafe_base64
  session["state"] = state

  query = {
    redirect_uri: redirect_uri,
    response_type: "code",
    client_id: client_id,
    scope: "basic names analyses phenotypes:read:sex",
    state: state
  }

  encoded_query = URI.encode_www_form(query)
  @url = base_url + "?" + encoded_query

  if session["access_token"]
    #token and headers for HTTP requests
    token = session["access_token"]
    headers = {"Authorization" => "Bearer #{token}"}

    #get profile information
    profile = HTTParty.get('https://api.23andme.com/1/names/', headers: headers)

    #create Person
    class Person
      attr_accessor :id, :first, :last
    end
    @person = Person.new
    @person.first = profile["first_name"]
    @person.last = profile["last_name"]
    @person.id = profile["profiles"][0]["id"]

    #get trait information
    traits = HTTParty.get('https://api.23andme.com/1/traits/' + @person.id, headers: headers)
    @traits = traits["traits"]
    binding.pry

    #get gender
    phenotypes = HTTParty.get('https://api.23andme.com/1/phenotypes/' + @person.id + '/sex', headers:headers)
    @gender = phenotypes["value"]

  end

  render :erb, :index

end

get '/receive_code/' do
  if session["state"] = params[:state]
    response = HTTParty.post('https://api.23andme.com/token/', body: {
      client_id: client_id,
      client_secret: client_secret,
      grant_type: "authorization_code",
      code: params[:code],
      redirect_uri: redirect_uri,
      scope: "basic names analyses phenotypes:read:sex"
    })
    session["access_token"] = response["access_token"]
  end
  redirect ('/')
end

get '/logout' do
  session["access_token"] = nil
  redirect('/')
end
