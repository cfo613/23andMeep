require 'sinatra'
require 'pry'
require 'httparty'
require_relative './lib/connection'
require_relative './lib/heros'
require_relative './lib/options'
require_relative './lib/questions'
require_relative './lib/responses'
require_relative './lib/users'

enable :sessions
set :session_secret, 'secret_lovers'

client_id = ENV['GEN_CLIENT_ID']
client_secret = ENV['GEN_CLIENT_SECRET']
redirect_uri = 'http://localhost:4567/receive_code/'

get '/' do
  render :erb, :index
end


get '/login' do

  render :erb, :login

end

get '/login/TTAM' do
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

  redirect(@url)

end

get '/assessment' do
  if session["access_token"]
    #token and headers for HTTP requests
    token = session["access_token"]
    headers = {"Authorization" => "Bearer #{token}"}

    #get profile information
    profile = HTTParty.get('https://api.23andme.com/1/names/', headers: headers)
    profile_id = profile["profiles"][0]["id"]
    #get gender
    phenotypes = HTTParty.get('https://api.23andme.com/1/phenotypes/' + profile_id + '/sex', headers:headers)

    #create user
    user_hash = {
      first_name: profile["first_name"],
      last_name: profile["last_name"],
      gender: phenotypes["value"]
    }
    user = User.create(user_hash);

    #create Person
    class Person
      attr_accessor :id, :first, :last
    end
    @person = Person.new
    @person.first = profile["first_name"]
    @person.last = profile["last_name"]
    @person.id =

    #get trait information
    traits = HTTParty.get('https://api.23andme.com/1/traits/' + profile_id, headers: headers)
    @traits = traits["traits"]


    @gender = phenotypes["value"]

  end

  erb :assessment, locals: {user: user, questions: Question.all(), options: Option.all()}

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
  redirect ('/assessment')
end

get '/logout' do
  session["access_token"] = nil
  redirect('/')
end
