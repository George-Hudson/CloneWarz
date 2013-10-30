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
    erb :page, locals: { content: get_content("") }
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

  get '/admin/edit/:id' do
    erb :edit, locals: { page: Pages.find_by_id(params[:id]) }
  end

  put '/admin/edit/:id' do |id|
    target_page = Pages.find_by_id(id)
    #grab new page values
    data = {
      id: id,
      title: params[:title],
      url: params[:url],
      heading: params[:heading],
      img: params[:img],
      body: params[:body],
      carousel_id: params[:carousel_id]
    }
    #update in db
    Pages.update(target_page.edit(data))
  end

  get '/*' do
    @page = get_page(params[:splat].first)
    raise not_found unless @page
    erb :page, locals: { page: @page }
  end

  helpers do
    def get_page(url)
      Pages.find_by_url("/#{url}")
    end
  end

end
