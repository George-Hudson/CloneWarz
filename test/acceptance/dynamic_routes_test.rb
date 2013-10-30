ENV['RACK_ENV'] = 'test'

require './test/test_helper'
require 'bundler'
Bundler.require
require 'rack/test'
require 'capybara'
require 'capybara/dsl'

require './lib/app'
require './lib/sweeper'

Capybara.app = CloneWarzApp

Capybara.register_driver :rack_test do |app|
  Capybara::RackTest::Driver.new(app, :headers =>  { 'User-Agent' => 'Capybara' })
end

class DynamicRoutesTest < Minitest::Test
  include Capybara::DSL

  def setup
    Pages.database
    Pages.create
    Sweeper.new
  end

  def teardown
    Pages.destroy(:pages)
  end

  def test_it_goes_to_a_route
    visit '/about'
    assert_equal page.status_code, 200
    assert page.has_content? "In short, Bikes Rule!"
  end

end
