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

  get '/admin/carousels' do
    #gather all carousels in an array
    #send them out
    erb :carousels, locals: { carousels: Carousels.all }
  end

  # get '/about' do
  #   erb :page
  # end

  get '/:url' do
    @content = get_content(params[:url])
    @content
  end

  helpers do
    def get_content(url)
      Pages.find_by_url(url).body
    end
  end

end
