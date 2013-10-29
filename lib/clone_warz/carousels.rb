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
    table.select.to_a.map do |data|
      data[:imgs] = JSON.parse(data[:imgs], {:symbolize_names => true})
      Carousel.new(data)
    end
  end

  def self.table
    database.from(:carousels)
  end

  def self.count
    table.count
  end

  def self.insert(carousel)
    table.insert(
      {
        name: carousel.name,
        imgs: carousel.imgs.to_json
      })
  end

  # def get_imgs
  #   JSON.parse(@imgs, {:symbolize_names => true}).map{|img|
  #     CarouselImage.new(img)}
  # end



end