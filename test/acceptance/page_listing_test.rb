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

class PageListingTest < Minitest::Test
  include Capybara::DSL

  def test_it_lists_all_pages
    visit '/admin'
    assert page.must_have_content("All Pages"), "Page listing cannot be found"
  end

end