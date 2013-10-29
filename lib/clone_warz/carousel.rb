require './lib/clone_warz/carousel_image'
require 'json'

class Carousel
  attr_reader :name, :imgs

  def initialize(data = {})
    @name = data[:name] || ""
    @imgs = data[:imgs] || []
  end
end