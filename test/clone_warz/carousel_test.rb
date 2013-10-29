require './test/test_helper'
require './lib/clone_warz/carousel'

class CarouselTest < Minitest::Test
  def test_it_exists
    assert Carousel
  end

  def test_it_initializes
    data = {
      name: "About Us Carousel",
      imgs: [
             {url: "/carousel_images/staff.jpg", title: "Bike Depot Staff", alt_tag: "Bike Depot Staff"},
             {url: "/carousel_images/community_programs.jpg", title: "Bike Depot Community Programs", alt_tag: "Bike Depot Community Programs"},
             {url: "/carousel_images/bike_collection.jpg", title: "Organize a Bike Collection Drive", alt_tags: "Organize a Bike Collection Drive"}
            ]
    }
    assert_equal data[:name], Carousel.new(data).name
    assert_equal data[:imgs], Carousel.new(data).imgs
  end

end
