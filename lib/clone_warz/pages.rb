require './lib/clone_warz/page'
require './lib/db'

class Pages < DB

  def self.create
    database.create_table :pages do
      primary_key :id
      String :title
      String :url
      String :heading
      String :img
      String :body
      foreign_key :carousel_id
    end unless database.table_exists?(:pages)
  end

  def self.table
    database.from(:pages)
  end

  def self.all
    table.select.to_a.map { |data| Page.new(data) }
  end

  def self.count
    table.count
  end

  def self.insert(page)
    table.insert(
      {
        title: page.title,
        url: page.url,
        heading: page.heading,
        img: page.img,
        body: page.body,
        carousel_id: page.carousel_id
      })
  end

end
