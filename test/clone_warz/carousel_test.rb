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
    assert_equal data[:imgs].to_json, Carousel.new(data).imgs
  end

  def test_it_will_make_individual_images
    data = {
      name: "About Us Carousel",
      imgs: [
             {url: "/carousel_images/staff.jpg", title: "Bike Depot Staff", alt_tag: "Bike Depot Staff"},
             {url: "/carousel_images/community_programs.jpg", title: "Bike Depot Community Programs", alt_tag: "Bike Depot Community Programs"},
             {url: "/carousel_images/bike_collection.jpg", title: "Organize a Bike Collection Drive", alt_tags: "Organize a Bike Collection Drive"}
            ]
    }
    carousel = Carousel.new(data)
    assert_equal data[:imgs][0][:url], carousel.get_imgs[0].url
    assert_equal data[:imgs][1][:url], carousel.get_imgs[1].url
    assert_equal data[:imgs][2][:url], carousel.get_imgs[2].url
  end

end
