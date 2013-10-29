require './test/test_helper'
require './lib/clone_warz/carousels'

class CarouselsTest < Minitest::Test

  def setup
    Carousels.create
  end

  def teardown
    DB.destroy(:carousels)
  end

  def test_it_creates_a_carousels_table
    schema = [[:id, {:allow_null=>false, :default=>nil, :primary_key=>true, :db_type=>"integer", :type=>:integer, :ruby_default=>nil}], [:name, {:allow_null=>true, :default=>nil, :primary_key=>false, :db_type=>"varchar(255)", :type=>:string, :ruby_default=>nil}], [:imgs, {:allow_null=>true, :default=>nil, :primary_key=>false, :db_type=>"varchar(255)", :type=>:string, :ruby_default=>nil}]]
    assert Carousels.database.table_exists?(:carousels)
    assert_equal schema, Carousels.database.schema(:carousels)
  end

  def test_it_inserts_data
    data = {
      name: "About Us Carousel",
      imgs: [
             {url: "/carousel_images/staff.jpg", title: "Bike Depot Staff", alt_tag: "Bike Depot Staff"},
             {url: "/carousel_images/community_programs.jpg", title: "Bike Depot Community Programs", alt_tag: "Bike Depot Community Programs"},
             {url: "/carousel_images/bike_collection.jpg", title: "Organize a Bike Collection Drive", alt_tag: "Organize a Bike Collection Drive"}
            ]
    }
    new_carousel = Carousel.new(data)
    Carousels.create
    assert_equal 0, Carousels.count
    Carousels.insert(new_carousel)
    assert_equal 1, Carousels.count
  end

  def test_it_gets_data
    data = {
      name: "About Us Carousel",
      imgs: [
             {url: "/carousel_images/staff.jpg", title: "Bike Depot Staff", alt_tag: "Bike Depot Staff"},
             {url: "/carousel_images/community_programs.jpg", title: "Bike Depot Community Programs", alt_tag: "Bike Depot Community Programs"},
             {url: "/carousel_images/bike_collection.jpg", title: "Organize a Bike Collection Drive", alt_tag: "Organize a Bike Collection Drive"}
            ]
    }
    new_carousel = Carousel.new(data)
    Carousels.create
    Carousels.insert(new_carousel)
    assert_equal new_carousel.name, Carousels.all.first.name
    assert_equal new_carousel.imgs, Carousels.all.first.imgs
  end

end