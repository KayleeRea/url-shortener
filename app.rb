require 'sinatra/base'

class App < Sinatra::Application
  URLPATH = []
  INPUTS = []
  SHORTS = []
  get '/' do
    URLPATH << request.url
    erb :index
  end

  post '/input' do
    INPUTS << params[:url_input]
    SHORTS << "#{INPUTS.length}"
    redirect '/stats'
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