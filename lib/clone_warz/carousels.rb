require './lib/clone_warz/carousel'

class Carousels

  def self.all
    [
    Carousel.new({name: 'Home Page Carousel'}),
    Carousel.new({name: 'About Us Carousel'})
    ]
  end

  

end