require 'sinatra'
require 'pry'
require 'httparty'
require_relative './lib/connection'
require_relative './lib/heros'
require_relative './lib/options'
require_relative './lib/questions'
require_relative './lib/responses'
require_relative './lib/users'

#enable sessions
enable :sessions
set :session_secret, 'secret_lovers'

#23andMe api keys
client_id = ENV['GEN_CLIENT_ID']
client_secret = ENV['GEN_CLIENT_SECRET']
redirect_uri = 'http://104.236.70.15/receive_code/'

get '/' do
  render :erb, :index
end


get '/login' do
  erb :login
end

get '/login/TTAM' do
  #23andme api base url
  base_url = "https://api.23andme.com/authorize/"
  #create state variable
  state = SecureRandom.urlsafe_base64
  session["state"] = state

  #create query hash
  query = {
    redirect_uri: redirect_uri,
    response_type: "code",
    client_id: client_id,
    scope: "basic names analyses phenotypes:read:sex",
    state: state
  }

  #encode query and append to base url
  encoded_query = URI.encode_www_form(query)
  @url = base_url + "?" + encoded_query

  redirect(@url)
end

get '/receive_code/' do
  #verify that session["state"] and state sent back by 23andMe are the same
  if session["state"] = params[:state]
    #send HTTP request for access to API data (scope defined in hash)
    response = HTTParty.post('https://api.23andme.com/token/', body: {
      client_id: client_id,
      client_secret: client_secret,
      grant_type: "authorization_code",
      code: params[:code],
      redirect_uri: redirect_uri,
      scope: "basic names analyses phenotypes:read:sex"
    })
    session["access_token"] = response["access_token"]
    session["user_id"] = nil
  end
  redirect ('/assessment')
end

get '/login/guest' do
  #just render guest page
  erb :guest
end

post '/guest' do
  #create user
  user_hash = {
    first_name: params["first"].capitalize,
    last_name: params["last"].capitalize,
    gender: params["gender"]
  }
  user = User.create(user_hash);

  #set session user id
  session["user_id"] = user[:id];

  redirect('/assessment')
end

get '/assessment' do
  #if using 23andme account
  if session["access_token"]
    #token and headers for HTTP requests
    token = session["access_token"]
    headers = {"Authorization" => "Bearer #{token}"}

    #get profile information
    profile = HTTParty.get('https://api.23andme.com/1/names/', headers: headers)
    profile_id = profile["profiles"][0]["id"]
    #get gender
    phenotypes = HTTParty.get('https://api.23andme.com/1/phenotypes/' + profile_id + '/sex', headers:headers)

    #create user based on 23andMe profile information
    user_hash = {
      first_name: profile["first_name"],
      last_name: profile["last_name"],
      gender: phenotypes["value"]
    }
    user = User.create(user_hash);

  end

  #if guest user
  if session["user_id"]
    #find previously created user by session["user_id"]
    user = User.find_by(id: session["user_id"])
  end

  erb :assessment, locals: {user: user, questions: Question.all(), options: Option.all()}

end

post '/results' do
  #create response
  response_hash = {
    answer1: params["q1"],
    answer2: params["q2"],
    answer3: params["q3"],
    answer4: params["q4"],
    user_id: params["user"]
  }
  response = Response.create(response_hash);

  #find user
  user = User.find_by(id: params["user"]);

  #get traits / weakenesses (if 23andMe user)
  if session["access_token"]
    #token and headers for HTTP requests
    token = session["access_token"]
    headers = {"Authorization" => "Bearer #{token}"}
    #get profile information
    profile = HTTParty.get('https://api.23andme.com/1/names/', headers: headers)
    profile_id = profile["profiles"][0]["id"]
    #get trait information
    traits = HTTParty.get('https://api.23andme.com/1/traits/' + profile_id, headers: headers)
    weaknesses = traits["traits"]
  #get demo traits / weaknesses (if guest user)
  else
    #token and headers for HTTP requests
    token = "fdab6a6892b198e40c2484bf2121f761"
    headers = {"Authorization" => "Bearer #{token}"}
    #get profile information
    profile = HTTParty.get('https://api.23andme.com/1/demo/names/', headers: headers)
    profile_id = profile["profiles"][0]["id"]
    #get trait information
    traits = HTTParty.get('https://api.23andme.com/1/demo/traits/' + profile_id, headers: headers)
    @weaknesses = traits["traits"]
  end

  erb :results, locals: {response: response, options: Option.all(), heroes: Hero.all(), user: user, weaknesses: @weaknesses}
end

get '/logout' do
  #rest session["access_token"] to nil
  session["access_token"] = nil
  redirect('/')
end
