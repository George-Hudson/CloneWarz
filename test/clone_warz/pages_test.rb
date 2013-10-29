require './test/test_helper'
require './lib/clone_warz/pages'

class PagesTest < Minitest::Test
  def test_it_exists
    assert Pages
  end

  def test_all_returns_pages
    pages = [
      Page.new({ title: "Home"}),
      Page.new({ title: "About"}),
      Page.new({ title: "Mission, Vision, and Values"}),
      Page.new({ title: "History"}),
      Page.new({ title: "Staff & Board"}),
      Page.new({ title: "Contact & Hours"}),
      Page.new({ title: "Privacy Policy"})
    ]
    assert pages, Pages.all
  end

end
