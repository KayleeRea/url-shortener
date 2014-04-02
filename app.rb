require 'sinatra/base'
require_relative './lib/error_message'

class App < Sinatra::Application
  URLPATH = []
  INPUTS = []
  SHORTS = []

    enable :sessions

  get '/' do
    URLPATH << request.url
    erb :index
  end

  post '/input' do
    @bar = params[:url_input]
    if @bar.empty?
     session[:message] = ErrorMessage.new.message
      redirect '/'
      session.delete(:message)
    else
      INPUTS << params[:url_input]
      SHORTS << "#{INPUTS.length}"
      redirect '/stats'
    end
  end

  get '/stats' do
    url_path = URLPATH[0]
    erb :stats, :locals => {:inputs => INPUTS, :shorts => SHORTS, :url_path => url_path}
  end

  get '/:id' do
    if INPUTS[params[:id].to_i-1].to_s.include?("http://")
      redirect INPUTS[params[:id].to_i-1].to_s
    else
      redirect 'http://'+INPUTS[params[:id].to_i-1].to_s
    end
  end
end