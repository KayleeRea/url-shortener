require 'sinatra/base'

class App < Sinatra::Application
  INPUTS = []
  SHORTS = []
  get '/' do
    erb :index
  end

  post '/stats' do
    INPUTS << params[:url_input]
    INPUTS.each_with_index do |url, index|
      SHORTS << "http://still-taiga-3763.herokuapp.com/#{(index + 1)}"
    end
    redirect '/stats'
  end

  get '/stats' do
    erb :stats, :locals => {:inputs => INPUTS, :shorts => SHORTS}
  end

end