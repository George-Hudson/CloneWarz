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

class PageListingTest < Minitest::Test
  include Capybara::DSL

  def test_it_lists_all_pages
    skip
    visit '/admin'
    assert page.has_content?("All Pages"), "Page listing cannot be found"
    assert page.has_content?("Home"), "Home listing does appear"
    assert page.has_content?("About"), "About listing does appear"
    assert page.has_content?("Mission, Vision, and Values"), "Mission, Vision, and Values listing does appear"
    assert page.has_content?("History"), "History listing does appear"
    assert page.has_content?("Staff & Board"), "Staff & Board listing does appear"
    assert page.has_content?("Contact & Hours"), "Contact & Hours listing does appear"
    assert page.has_content?("Privacy Policy"), "Privacy Policy listing does appear"
  end
end
