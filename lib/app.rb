require 'bundler'
Bundler.require

class CloneWarzApp < Sinatra::Base
  set :method_override, true
  set :root, './lib/app'

  not_found do
    erb :error
  end

  get '/' do
    erb :index
  end

  get '/admin' do
    erb :admin
  end

end
