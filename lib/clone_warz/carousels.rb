require './lib/clone_warz/carousel'
require './lib/db'

class Carousels < DB

  def self.create
    database.create_table(:carousels) do 
      primary_key :id
      String :name
      String :imgs
    end unless database.table_exists?(:carousels)
  end

  def self.all
    [
    Carousel.new({name: 'Home Page Carousel'}),
    Carousel.new({name: 'About Us Carousel'})
    ]
  end

  def self.table
    database.from(:carousels)
  end


  

end