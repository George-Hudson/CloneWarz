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

  def test_it_lists_all_carousels
    visit '/admin/carousels'
    assert page.has_content?("All Carousels"), "No data for All Carousels"
    assert page.has_content?("Home Page Carousel"), "No data for  Home Page Carousels"
    assert page.has_content?("About Us Carousel"), "No data for  About Us Carousels"
  end
end