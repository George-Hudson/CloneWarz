class CarouselImage

  attr_reader :url, :title, :alt_tag

  def initialize(data = {})
    @url = data[:url]
    @title = data[:title]
    @alt_tag = data[:alt_tag]
  end


end