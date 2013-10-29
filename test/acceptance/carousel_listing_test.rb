ENV['RACK_ENV'] = 'test'

require './test/test_helper'
require 'bundler'
Bundler.require
require 'rack/test'
require 'capybara'
require 'capybara/dsl'

require './lib/app'

Capybara.app = CloneWarzApp

Capybara.register_driver :rack_test do |app|
  Capybara::RackTest::Driver.new(app, :headers =>  { 'User-Agent' => 'Capybara' })
end

class CarouselListingTest < Minitest::Test
  include Capybara::DSL

  def setup
    Carousels.create
  end

  def teardown
    DB.destroy(:carousels)
  end

  def test_it_lists_all_carousels
    data = {
      name: "About Us Carousel",
      imgs: [
             {url: "/carousel_images/staff.jpg", title: "Bike Depot Staff", alt_tag: "Bike Depot Staff"},
             {url: "/carousel_images/community_programs.jpg", title: "Bike Depot Community Programs", alt_tag: "Bike Depot Community Programs"},
             {url: "/carousel_images/bike_collection.jpg", title: "Organize a Bike Collection Drive", alt_tags: "Organize a Bike Collection Drive"}
            ]
    }
    Carousels.insert(Carousel.new(data))

    data.merge!(name: "Home Page Carousel")
    Carousels.insert(Carousel.new(data))

    visit '/admin/carousels'
    assert page.has_content?("All Carousels"), "No data for All Carousels"
    assert page.has_content?("Home Page Carousel"), "No data for  Home Page Carousels"
    assert page.has_content?("About Us Carousel"), "No data for  About Us Carousels"
  end
end