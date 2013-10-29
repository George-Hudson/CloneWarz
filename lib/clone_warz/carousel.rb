require './lib/clone_warz/carousel_image'

class Carousel
  attr_reader :name, :imgs

  def initialize(data = {})
    @name = data[:name] || ""
    @imgs = make_imgs(data[:imgs]) || []
  end

  def make_imgs(data = [])
    data.collect do |img_data|
      CarouselImage.new(img_data)
    end
  end
end