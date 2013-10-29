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
      String :associated_carousel
    end unless database.table_exists?(:pages)
  end

  def self.table
    database.from(:pages)
  end

  def self.all
    table.select.to_a
  end

end
