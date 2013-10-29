require './lib/clone_warz/carousel_image'
require 'json'

class Carousel
  attr_reader :name, :imgs

  def initialize(data = {})
    @name = data[:name] || ""
    @imgs = data[:imgs].to_json || "" 
  end


  def get_imgs
    JSON.parse(@imgs, {:symbolize_names => true}).map{|img|  
      CarouselImage.new(img)}     
  end

end