require './test/test_helper'
require './lib/clone_warz/carousel_image'

class CarouselImageTest < Minitest::Test
  def test_it_exists
    assert CarouselImage
  end

  def test_it_initializes_on_a_hash_of_data
    data = {
            url: "/carousel_images/staff.jpg",
            title: "Bike Depot Staff",
            alt_tag: "Bike Depot Staff"
           }
    assert_equal data[:url], CarouselImage.new(data).url
    assert_equal data[:title], CarouselImage.new(data).title
    assert_equal data[:alt_tag], CarouselImage.new(data).alt_tag
  end

end