require 'bundler'
Bundler.require
require './lib/clone_warz'

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
    #gather all pages in an array
    #send them out
    erb :admin, locals: { pages: Pages.all }
  end

end
