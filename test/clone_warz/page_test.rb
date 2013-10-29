require './test/test_helper'
require './lib/clone_warz/page'

class PageTest < Minitest::Test
  def test_it_exists
    assert Page
  end

  def test_it_initializes
    data = {
      title: "About",
      url: "/about",
      heading: "About",
      img: nil,
      body: "The Bike Depot is Denver's only non-profit bike shop.",
      associated_carousel: nil
    }
    assert_equal data[:title], Page.new(data).title
    assert_equal data[:url], Page.new(data).url
    assert_equal data[:heading], Page.new(data).heading
    assert_equal data[:body], Page.new(data).body
  end
end


