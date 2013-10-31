require './test/test_helper'
require './lib/clone_warz/page'

class PageTest < Minitest::Test
  def test_it_exists
    assert Page
  end

  def test_it_initializes
    data = {
      id: 1,
      title: "About",
      url: "/about",
      heading: "About",
      img: nil,
      body: "The Bike Depot is Denver's only non-profit bike shop.",
      carousel_id: nil
    }
    assert_equal data[:title], Page.new(data).title
    assert_equal data[:url], Page.new(data).url
    assert_equal data[:heading], Page.new(data).heading
    assert_equal data[:body], Page.new(data).body
    assert_equal data[:id], Page.new(data).id
  end

  def test_edit_edits
    data = {
      id: 1,
      title: "About",
      url: "/about",
      heading: "About",
      img: nil,
      body: "The Bike Depot is Denver's only non-profit bike shop.",
    }
    test_page = Page.new(data)
    new_data = {
      title: "About Us",
      url: "/about-us",
      heading: "About Us",
      img: nil,
      body: "We. Rock.",
    }
    test_page.edit(new_data)
    assert_equal new_data[:title], test_page.title
    assert_equal new_data[:url], test_page.url
    assert_equal new_data[:heading], test_page.heading
    assert_equal new_data[:body], test_page.body
    assert_equal data[:id], test_page.id    
  end

  def test_to_h_returns_a_hash
    data = {
      title: "About",
      url: "/about",
      heading: "About",
      img: "",
      body: "The Bike Depot is Denver's only non-profit bike shop.",
      carousel_id: 0
    }
    assert_equal data, Page.new(data).to_h
  end
end
